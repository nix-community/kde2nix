{
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "granatier";

  extraBuildInputs = [qtsvg];
}
