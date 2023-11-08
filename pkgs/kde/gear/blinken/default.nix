{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "blinken";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
