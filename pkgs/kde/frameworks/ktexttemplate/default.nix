{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "ktexttemplate";

  extraBuildInputs = [qtdeclarative];

  meta.license = [ ];
}
