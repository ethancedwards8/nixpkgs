{
  lib,
  python3Packages,
  fetchFromGitHub,
  versionCheckHook,
}:

python3Packages.buildPythonApplication rec {
  pname = "owasp-dep-scan";
  version = "6.0.0a3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "owasp-dep-scan";
    repo = "dep-scan";
    tag = "v${version}";
    hash = "sha256-lgqS8GY5JuHL3strNcb0B3mGieFkQTzGuRyV4dBp5e4=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = with python3Packages; [
    appthreat-vulnerability-db
    cvss
    defusedxml
    jinja2
    oras
    packageurl-python
    pdfkit
    pygithub
    pyyaml
    quart
    rich
    toml
    tomli
  ];

  # pythonRelaxDeps = [
  #   "appthreat-vulnerability-db"
  #   "oras"
  # ];

}

