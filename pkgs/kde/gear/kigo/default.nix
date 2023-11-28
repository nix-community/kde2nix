{
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kigo";

  extraBuildInputs = [qtsvg];
}
