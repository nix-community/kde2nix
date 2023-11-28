{
  mkKdeDerivation,
  qtdeclarative,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kmahjongg";

  extraBuildInputs = [qtdeclarative qtsvg];
}
