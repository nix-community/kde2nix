{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kigo";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
