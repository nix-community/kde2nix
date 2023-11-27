{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "libkmahjongg";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
