{
  mkKdeDerivation,
  kactivities,
}:
mkKdeDerivation {
  pname = "krunner";

  extraBuildInputs = [kactivities];
}
