{
  lib,
  stdenv,
  fetchurl,
  pkg-config,
  gettext,
  guile,
  xorg,
  libGLU,
  mesa,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gnubik";
  version = "2.4.3";

  src = fetchurl {
    url = "mirror://gnu/gnubik/gnubik-${finalAttrs.version}.tar.gz";
    hash = "sha256-Kz7Tb7W6nuyA/Yb5Tqu+hmUG9P4ZSKnXSA8iXIlIju4=";
  };

  nativeBuildInputs = [
    pkg-config
    gettext
    guile
  ];

  buildInputs = [
    guile
    xorg.libX11
    libGLU
    mesa
  ];

  meta = {
    homepage = "https://www.gnu.org/software/gnubik/";
    description = "3d Rubik's cube game";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    platforms = guile.meta.platforms;
  };
})
