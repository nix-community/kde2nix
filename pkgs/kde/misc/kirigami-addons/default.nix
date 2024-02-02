{
  lib,
  mkKdeDerivation,
  fetchurl,
  qtdeclarative,
  qt5compat,
  kitemmodels,
  qqc2-desktop-style,
}:
mkKdeDerivation rec {
  pname = "kirigami-addons";
  version = "0.11.90";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-e/klCZkkqntvoSPGTN8QhbzD/MgPcFC5Qlzsf+RhvK4=";
  };

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [qt5compat kitemmodels qqc2-desktop-style];

  meta.license = with lib.licenses; [
    bsd2
    cc-by-sa-40
    cc0
    gpl2Plus
    lgpl2Only
    lgpl2Plus
    lgpl21Only
    lgpl21Plus
    lgpl3Only
  ];
}
