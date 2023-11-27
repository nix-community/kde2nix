{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  qtsvg,
}:
mkKdeDerivation {
  pname = "ksvg";

  extraBuildInputs = [qtdeclarative qtsvg];

  meta.license = [ ];
}
