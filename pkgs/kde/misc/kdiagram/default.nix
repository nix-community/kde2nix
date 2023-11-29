{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  qttools,
  qtsvg,
}:
mkKdeDerivation rec {
  pname = "kdiagram";
  version = "unstable-2023-11-26";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "graphics";
    repo = pname;
    rev = "b976be76242cc0cf2359817559df2c1b56551c43";
    sha256 = "sha256-lxmkv0/bGwmzOy0d1YPBCQmc9agm+vFdymD/Tb8yuhY=";
  };

  extraNativeBuildInputs = [qttools qtsvg];

  meta.license = [lib.licenses.gpl2];
}
