{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kitemmodels";

  extraBuildInputs = [qtdeclarative];

  meta.license = [ ];
}
