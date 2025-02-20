{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  pango,
  SDL2,
  SDL2_ttf,
  SDL2_image,
  SDL2_mixer,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "starfighter";
  version = "2.4";

  src = fetchFromGitHub {
    owner = "pr-starfighter";
    repo = "starfighter";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lluZ7f/GgAVMcGNhjtnPDVHrOr6TfZOkkg3+eNeHaaM=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pango
    SDL2
    SDL2_ttf
    SDL2_image
    SDL2_mixer
  ];

  meta = {
    description = "2D scrolling shooter game";
    homepage = "https://pr-starfighter.github.io/";
    downloadPage = "https://github.com/pr-starfighter/starfighter";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    # mainProgram = "msnake";
  };
})
