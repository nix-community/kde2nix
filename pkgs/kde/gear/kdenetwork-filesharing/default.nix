{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kdenetwork-filesharing";

  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
