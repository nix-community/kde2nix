{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "klettres";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
