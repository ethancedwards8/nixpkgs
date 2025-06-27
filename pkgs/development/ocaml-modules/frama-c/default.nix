{
  lib,
  stdenv,
  fetchFromGitLab,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "frama-c";
  version = "31.0";

  src = fetchFromGitLab {
    domain = "git.frama-c.com";
    owner = "pub";
    repo = "frama-c";
    tag = version;
    hash = "";
  };

  nativeBuildInputs = [

  ];
})
