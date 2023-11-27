{
  lib,
  mkKdeDerivation,
  qtspeech,
  qttools,
}:
mkKdeDerivation {
  pname = "ktextwidgets";

  extraBuildInputs = [
    qtspeech
    qttools
  ];

  meta.license = [ ];
}
