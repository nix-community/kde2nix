{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kpeople";

  extraBuildInputs = [qtdeclarative];

  meta.license = [ ];
}
