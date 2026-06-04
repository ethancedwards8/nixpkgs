{
  lib,
  buildDunePackage,
  fetchFromGitHub,
  astring,
  fmt,
  tyxml,
  alcotest,
}:

buildDunePackage (finalAttrs: {
  pname = "ansi";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "ocurrent";
    repo = "ansi";
    tag = finalAttrs.version;
    hash = "sha256-VZR8hz2v4gAvTkizBt59DSYr3tGPWT1Iid8m8YQx48Y=";
  };

  propagatedBuildInputs = [
    astring
    fmt
    tyxml
  ];

  checkInputs = [
    alcotest
  ];

  doCheck = true;

  meta = {
    description = "ANSI escape sequence parser";
    homepage = "https://ocurrent.github.io/ansi/";
    downloadPage = "https://github.com/ocurrent/ansi/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
})
