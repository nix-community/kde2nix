{
  lib,
  mkKdeDerivation,
  kactivities,
}:
mkKdeDerivation {
  pname = "krunner";

  extraBuildInputs = [kactivities];

  meta.license = null;
}
