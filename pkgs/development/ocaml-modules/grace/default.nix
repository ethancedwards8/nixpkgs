{
  lib,
  buildDunePackage,
  fetchFromGitHub,
  fmt,
  iter,
  ppx_sexp_conv,
  sexplib,
  uutf,
  yojson,
  core,
  core_unix,
  dedent,
  ppx_jane,
}:

buildDunePackage (finalAttrs: {
  pname = "grace";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "johnyob";
    repo = "grace";
    tag = finalAttrs.version;
    hash = "sha256-V5K9RGk47K/R+q4wS1FU02kMi1uWSCgdUjKHk7uXuGw=";
  };

  propagatedBuildInputs = [
    fmt
    ppx_sexp_conv
    sexplib
    uutf
    yojson
  ];

  checkInputs = [
    iter
    core
    core_unix
    dedent
    ppx_jane
  ];

  doCheck = true;

})
