{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kcmutils";

  extraPropagatedBuildInputs = [qtdeclarative];

  meta.license = [ ];
}
