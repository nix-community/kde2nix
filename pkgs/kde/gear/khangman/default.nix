{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "khangman";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
