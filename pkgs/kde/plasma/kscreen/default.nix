{
  mkKdeDerivation,
  qtsensors,
}:
mkKdeDerivation {
  pname = "kscreen";

  extraBuildInputs = [qtsensors];
}
