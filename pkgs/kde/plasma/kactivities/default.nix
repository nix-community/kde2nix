{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  boost,
}:
mkKdeDerivation {
  pname = "kactivities";

  extraBuildInputs = [qtdeclarative boost];

  meta.license = [ ];
}
