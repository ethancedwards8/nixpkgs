{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  intltool,
  gettext,
}:

stdenv.mkDerivation {
  pname = "morris";
  version = "0.3";

  src = fetchFromGitHub {
    owner = "farindk";
    repo = "morris";
    tag = "v${version}";
    hash = "";
  };

  buildInputs = [

  ];

  meta = {
    homepage = "";
    description = "";
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.linux;
    # mainProgram = "";
  };
}

