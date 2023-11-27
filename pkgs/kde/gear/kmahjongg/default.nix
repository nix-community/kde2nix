{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kmahjongg";

  extraBuildInputs = [qtdeclarative qtsvg];

  meta.license = [ ];
}
