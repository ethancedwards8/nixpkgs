{ lib, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "piston-cli";
  version = "1.5.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "YzQo22/63IJ78Y7pqk7W1galI+HNk7gIodiDlHwNllY=";
  };

  propagatedBuildInputs = with python3Packages; [ coloredlogs requests-cache rich prompt-toolkit requests pygments pyyaml more-itertools ];

  checkPhase = ''
    $out/bin/piston --help > /dev/null
  '';

  meta = with lib; {
    description = "Piston api tool";
    homepage = "https://github.com/Shivansh-007/piston-cli";
    license = licenses.mit;
    maintainers = with maintainers; [ ethancedwards8 ];
  };
}
