{
  lib,
  mkKdeDerivation,
  fetchurl,
  qttools,
  qtsvg,
}:
mkKdeDerivation rec {
  pname = "kdiagram";
  version = "3.0.0";

  src = fetchurl {
    url = "mirror://kde/stable/${pname}/${version}/${pname}-${version}.tar.xz";
    hash = "sha256-bV9T390BkBgVHAGToB7tNt8QERqSx8Bu19YxU16UPCE=";
  };

  extraNativeBuildInputs = [qttools qtsvg];

  meta.license = [lib.licenses.gpl2];
}
