{
  lib,
  stdenv,
  fetchFromGitHub,
  xorg,
  libpulseaudio
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ascii-patrol";
  version = "1.7";

  src = fetchFromGitHub {
    owner = "msokalski";
    repo = "ascii-patrol";
    tag = finalAttrs.version;
    hash = "sha256-9LFq+Ti7cTe3sFwSejmFdisWISLt4A18UmOrlMpCkqA=";
  };

  buildInputs = [
    xorg.libX11
    xorg.libXi
    libpulseaudio
  ];

  # upstream is a hardcoded g++ script
  buildPhase = ''
    runHook preBuild

    $CC -pthread \
	    -Wno-multichar \
	    -O3 \
	    -D NIX \
	    manual.cpp \
	    mo3.cpp \
	    unmo3.cpp \
	    stb_vorbis.cpp \
	    conf.cpp \
	    gameover.cpp \
	    inter.cpp \
	    twister.cpp \
	    game.cpp \
	    temp.cpp \
	    menu.cpp \
	    assets.cpp \
	    spec_dos.cpp \
	    spec_win.cpp \
	    spec_nix.cpp \
	    spec_web.cpp \
	    -L${xorg.libX11.out}/lib \
	    -lX11 \
	    -lXi \
	    -lpulse \
	    -o asciipat

    runHook postBuild
  '';

  meta = {
    homepage = "https://ascii-patrol.com/";
    description = "ASCII game inspired by Moon Patrol";
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    # mainProgram = "anarch";
  };
})
