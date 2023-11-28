{
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kdenetwork-filesharing";

  extraBuildInputs = [qtdeclarative];
}
