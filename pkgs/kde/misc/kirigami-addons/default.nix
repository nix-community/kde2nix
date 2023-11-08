{
  mkKdeDerivation,
  fetchurl,
  qtdeclarative,
  qt5compat,
}:
mkKdeDerivation rec {
  pname = "kirigami-addons";
  version = "0.11.75";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-KKiqhapIZA/JjUlq5EpTVOlStSC4h2L24Hh/d4i6GxQ=";
  };

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [qt5compat];
}
