{
  lib,
  buildDunePackage,
  fetchFromGitHub,
}:

buildDunePackage rec {
  pname = "ocaml-quic";
  version = "0-unstable-2023-07-29";

  src = fetchFromGitHub {
    owner = "anmonteiro";
    repo = "ocaml-quic";
    rev = "97a2d504749155f2969799dc5e06403a89f0940a";
    hash = "sha256-wSk48m9UtwnFev8DyxCvWz0L0Rb3KZGOEsL83JMiGF0=";
  };

  doCheck = true;

}
