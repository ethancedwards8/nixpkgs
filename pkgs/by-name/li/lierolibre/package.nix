{
  lib,
  stdenv,
  fetchFromGitLab,
  SDL,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "anarch";
  version = "1.0-unstable-2025-02-09";

  src = fetchFromGitLab {
    owner = "lierolibre";
    repo = "lierolibre";
    rev = "ae584b245fedac3cb7030d8b9591f36632b0f29b";
    hash = "";
    fetchSubmodules = true;
  };

  buildInputs = [
    SDL
  ];

  meta = {
    homepage = "https://gitlab.com/lierolibre/lierolibre";
    description = "Old-school earthworm action game";
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    license = lib.licenses.bsd2;
    platforms = lib.platforms.unix;
    mainProgram = "";
  };
})
