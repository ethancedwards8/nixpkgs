{
  lib,
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  guile,
  pkg-config,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "dbi";
  version = "2.1.9";

  src = fetchFromGitHub {
    owner = "opencog";
    repo = "guile-dbi";
    tag = "guile-dbi-${finalAttrs.version}";
    hash = "sha256-4xBsx0hZEKJg01VOfA5F2fCMaUAL/xq3limRccLTG8Q=";
  };

  sourceRoot = "${finalAttrs.src}/guile-dbi";

  strictDeps = true;

  nativeBuildInputs = [
    autoreconfHook
    guile
    # pkg-config
    # texinfo
  ];

  buildInputs = [
    guile
  ];

  meta = {
    description = "Guile Scheme SQL database interfaces";
    homepage = "https://github.com/opencog/guile-dbi";
    changelog = "https://github.com/opencog/guile-dbi/releases/tag/guile-dbi-${finalAttrs.version}";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    platforms = guile.meta.platforms;
  };
})

