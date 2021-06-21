{ stdenv, lib, fetchFromGitHub, qmake, qttools, qtbase }:

stdenv.mkDerivation rec {
  pname = "sqlitestudio";
  version = "3.3.3";

  src = fetchFromGitHub {
    owner = "pawelsalawa";
    repo = pname;
    rev = version;
    sha256 = "7xD0uW8TxFF5awCAB27fdv4g3XIZEyhLjIrLOECzW4E=";
  };

  sourceRoot = "SQLiteStudio3";

  dontWrapQtApps = true;

  nativeBuildInputs = [
    qmake qttools /*wrapQtAppsHook*/
  ];

  buildInputs = [
    qtbase
  ];

  # qmakeFlags = [

  # ];

  meta = with lib; {
    description = "A free, open source, multi-platform SQLite database manager.";
    homepage = "https://github.com/pawelsalawa/sqlitestudio";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ethancedwards8 ];
  };
}
