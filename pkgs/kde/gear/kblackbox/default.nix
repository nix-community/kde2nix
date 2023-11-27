{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kblackbox";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
