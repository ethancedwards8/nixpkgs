{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
  versionCheckHook,
  git,
}:

stdenv.mkDerivation (finalAttrs: {
  # confict with other antares package
  pname = "antares-game";
  version = "0.9.1";

  src = fetchFromGitHub {
    owner = "arescentral";
    repo = "antares";
    tag = "v${finalAttrs.version}";
    hash = "";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    # python3
  ];

  buildInputs = [
  ];

  # configurePhase = ''
  #   runHook preConfigure
  #   ls -la
  #   git submodule update --init build ext data
  #   ./configure
  #   runHook postConfigure
  # '';


  # nativeInstallCheckHooks = [
  #   versionCheckHook
  # ];
  # doInstallCheck = true;

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = {
    description = "";
    homepage = "";
    license = with lib.licenses; [ gpl3Only lgpl3Only ];
    platforms = lib.platforms.darwin;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    # mainProgram = "";
  };
})
