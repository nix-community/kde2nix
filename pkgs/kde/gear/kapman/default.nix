{
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kapman";

  extraBuildInputs = [qtsvg];
}
