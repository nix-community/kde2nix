{
  lib,
  stdenv,
  fetchFromGitLab,
  cmake,
  extra-cmake-modules,
  qttools,
  qtbase,
  qtsvg,
}:
stdenv.mkDerivation rec {
  pname = "kdiagram";
  version = "unstable-2023-11-26";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "graphics";
    repo = pname;
    rev = "b976be76242cc0cf2359817559df2c1b56551c43";
    sha256 = "sha256-lxmkv0/bGwmzOy0d1YPBCQmc9agm+vFdymD/Tb8yuhY=";
  };

  nativeBuildInputs = [cmake extra-cmake-modules qttools];
  propagatedBuildInputs = [qtbase qtsvg];

  cmakeFlags = ["-DQT_MAJOR_VERSION=6"];
  dontWrapQtApps = true;

  meta = {
    description = "Libraries for creating business diagrams";
    license = lib.licenses.gpl2;
    platforms = qtbase.meta.platforms;
    maintainers = [lib.maintainers.ttuegel];
  };
}
