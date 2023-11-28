{
  mkKdeDerivation,
  qtdeclarative,
  kdeclarative,
  prison,
}:
mkKdeDerivation {
  pname = "purpose";

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [kdeclarative prison];
}
