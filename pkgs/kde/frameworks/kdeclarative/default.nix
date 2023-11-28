{
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kdeclarative";

  extraBuildInputs = [qtdeclarative];
}
