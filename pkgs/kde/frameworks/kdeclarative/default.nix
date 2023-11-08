{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kdeclarative";

  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
