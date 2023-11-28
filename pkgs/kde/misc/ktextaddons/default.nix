{
  lib,
  mkKdeDerivation,
  fetchurl,
  qtspeech,
  qttools,
}:
mkKdeDerivation rec {
  pname = "ktextaddons";
  version = "1.5.2";

  src = fetchurl {
    url = "mirror://kde/stable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-KIu7HO+x6LVwo4PHkuul/KKRxG3QFV28JTHwo2aEp9s=";
  };

  extraBuildInputs = [qtspeech qttools];

  meta.license = with lib.licenses; [
    bsd3
    cc0
    gpl2Plus
    lgpl2Plus
    lgpl21Plus
  ];
}
