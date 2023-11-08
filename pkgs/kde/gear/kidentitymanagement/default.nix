{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kidentitymanagement";

  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
