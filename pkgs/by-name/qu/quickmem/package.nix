{
  lib,
  stdenv,
  fetchFromGitLab,
  cmake,
  doxygen,
  graphviz,
  arpa2common,
  arpa2cm,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "quickmem";
  version = "1.0.0";

  strictDeps = true;
  __structuredAttrs = true;

  src = fetchFromGitLab {
    owner = "arpa2";
    repo = "Quick-MEM";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cqg8QN4/I+zql7lVDDAgFA05Dmg4ylBTvPSPP7WATdc=";
  };

  nativeBuildInputs = [
    cmake
    doxygen
    graphviz
  ];

  buildInputs = [
    arpa2cm
    arpa2common
  ];

  doCheck = true;

  meta = {
    description = "Memory pooling for ARPA2 projects";
    homepage = "https://gitlab.com/arpa2/Quick-MEM/";
    license = lib.licenses.bsd2;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ leungbk ];
    teams = [ lib.teams.ngi ];
  };
})
