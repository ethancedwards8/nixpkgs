{
  lib,
  stdenv,
  fetchFromGitHub,
  gradle_8,
  jdk17_headless,
  makeWrapper,
  bash,
  coreutils,
  findutils,
  gawk,
  gnugrep,
  gnused,
  procps,
  nix-update-script,
}:

let
  jdk = jdk17_headless;
  gradle = gradle_8.override { java = jdk; };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "automq";
  version = "1.7.4";

  src = fetchFromGitHub {
    owner = "AutoMQ";
    repo = "automq";
    tag = finalAttrs.version;
    hash = "sha256-t30YebyDknC9sLxDxvQPbNkOjSWLvs5hWyDWXFODTxQ=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    gradle
    makeWrapper
  ];
  buildInputs = [ bash ];

  mitmCache = gradle.fetchDeps {
    inherit (finalAttrs) pname;
    data = ./deps.json;
  };

  # javac otherwise reads UTF-8 sources as US-ASCII in the sandbox
  env.JAVA_TOOL_OPTIONS = "-Dfile.encoding=UTF-8";

  gradleBuildTask = "releaseTarGz";
  gradleUpdateTask = finalAttrs.gradleBuildTask;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    tar -xzf core/build/distributions/kafka-*[0-9].tgz -C $out --strip-components=1
    rm -r $out/bin/windows $out/docker $out/site-docs

    # Logs default to $base_dir/logs, which is in the read-only store
    substituteInPlace $out/bin/kafka-run-class.sh \
      --replace-fail 'LOG_DIR="$base_dir/logs"' 'LOG_DIR="''${KAFKA_LOG_DIR:-/tmp/automq-logs}"'

    for p in $out/bin/*.sh; do
      wrapProgram "$p" \
        --set-default JAVA_HOME "${jdk.home}" \
        --prefix PATH : "${
          lib.makeBinPath [
            coreutils
            findutils
            gawk
            gnugrep
            gnused
            procps
          ]
        }"
    done

    runHook postInstall
  '';

  # AutoMQ reports the version of the Kafka release it is based on
  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck

    kafkaVersion=$(sed -n 's/^version=//p' gradle.properties)
    HOME=$TMPDIR $out/bin/kafka-topics.sh --version | grep -F "$kafkaVersion"

    runHook postInstallCheck
  '';

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--version-regex"
      "^(\\d+\\.\\d+\\.\\d+)$"
    ];
  };

  meta = {
    description = "Kafka-compatible streaming platform that stores data on S3";
    homepage = "https://www.automq.com";
    changelog = "https://github.com/AutoMQ/automq/releases/tag/${finalAttrs.version}";
    license = lib.licenses.asl20;
    sourceProvenance = with lib.sourceTypes; [
      fromSource
      binaryBytecode # mitm cache
    ];
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    platforms = lib.platforms.linux;
  };
})
