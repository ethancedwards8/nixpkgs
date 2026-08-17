{
  lib,
  stdenv,
  fetchFromGitHub,
  gradle,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "automq";
  version = "1.7.2";

  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "AutoMQ";
    repo = "automq";
    tag = finalAttrs.version;
    hash = "sha256-fkyMlI12CV+yQnjsXjI6T18NafT08wSof6m/3hRQZss=";
  };

  nativeBuildInputs = [
    gradle
  ];

  meta = {
    description = "Diskless Kafka on S3";
    homepage = "https://github.com/AutoMQ/automq";
    changelog = "https://github.com/AutoMQ/automq/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
})
