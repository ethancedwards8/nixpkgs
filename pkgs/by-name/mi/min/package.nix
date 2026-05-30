{
  lib,
  buildNimPackage,
  fetchFromGitHub,
  openssl,
}:

buildNimPackage (finalAttrs: {
  pname = "min";
  version = "0.45.0";

  src = fetchFromGitHub {
    owner = "h3rald";
    repo = "min";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Uw03aSFn3EV3H2SkYoYzM5S/WLhEmLV8s3mRF3oT8ro=";
  };

  lockFile = ./lock.json;

  nimFlags = [ "-d:nopcre" ];

  buildInputs = [ openssl ];

  prePatch = ''
    # remove vendorabilities
    find . -name '*.a' -delete
    find minpkg/lib -name '*.nim' \
      -exec sed 's|{\.passL:.*\.}|discard|g' -i {} \;
  '';

  meta = {
    description = "Functional, concatenative programming language with a minimalist syntax";
    homepage = "https://min-lang.org/";
    changelog = "https://github.com/h3rald/min/releases/tag/${finalAttrs.src.rev}";
    license = lib.licenses.mit;
    mainProgram = "min";
  };

})
