{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "granatier";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
