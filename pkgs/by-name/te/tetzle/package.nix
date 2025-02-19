{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  libsForQt5,
  qt5
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "tetzle";
  version = "3.0.2";

  src = fetchFromGitHub {
    owner = "gottcode";
    repo = "tetzle";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1elFcgWoidkBZcRPhnOAgzz5tU4+aeUujgtuCePxffQ=";
  };

  nativeBuildInputs = [
    cmake
    libsForQt5.qt5.qttools
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    libsForQt5.qt5.qtbase
  ];

  meta = {
    description = "Jigsaw puzzle game that uses tetrominoes for the pieces";
    homepage = "https://github.com/gottcode/tetzle";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    mainProgram = "tetzle";
  };
})
