{
  lib,
  stdenv,
  fetchFromGitHub,
  openssl,
  versionCheckHook,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "mktorrent";
  version = "1.1";

  strictDeps = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pobrn";
    repo = "mktorrent";
    tag = "v${finalAttrs.version}";
    hash = "sha256-uUUbRed90WsthTwzrAbSpqiHdCzWCIxcGoc2q2ph7Z4=";
  };

  makeFlags = [
    "USE_PTHREADS=1"
    "USE_OPENSSL=1"
    "USE_LONG_OPTIONS=1"
  ]
  ++ lib.optional stdenv.hostPlatform.isi686 "USE_LARGE_FILES=1"
  ++ lib.optional stdenv.hostPlatform.isLinux "CFLAGS=-lgcc_s";

  installFlags = [ "PREFIX=${placeholder "out"}" ];

  buildInputs = [ openssl ];

  nativeInstallCheckInputs = [ versionCheckHook ];
  versionCheckProgramArg = "--help";
  doInstallCheck = true;

  meta = {
    description = "Command line utility to create BitTorrent metainfo files";
    homepage = "https://github.com/pobrn/mktorrent/wiki";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [
      winter
    ];
    platforms = lib.platforms.all;
    mainProgram = "mktorrent";
  };
})
