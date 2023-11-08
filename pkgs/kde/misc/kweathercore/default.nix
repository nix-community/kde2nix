{
  lib,
  stdenv,
  fetchFromGitLab,
  cmake,
  extra-cmake-modules,
  qtbase,
  qtpositioning,
  kholidays,
  ki18n,
}:
stdenv.mkDerivation {
  pname = "kweathercore";
  version = "unstable-2023-11-20";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "libraries";
    repo = "kweathercore";
    rev = "d6408746c3cf7423e4e89ea4a8a9b82f550d789b";
    hash = "sha256-NIOfr+qM05emFcM43BTFOXeHlxmDmH7yOE8hakVdJ28=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [
    qtbase
    qtpositioning
    kholidays
    ki18n
  ];

  cmakeFlags = ["-DQT_MAJOR_VERSION=6"];
  dontWrapQtApps = true;

  meta = with lib; {
    description = "Library to facilitate retrieval of weather information including forecasts and alerts";
    homepage = "https://invent.kde.org/libraries/kweathercore";
    license = null;
    mainProgram = "kweathercore";
    platforms = platforms.all;
  };
}
