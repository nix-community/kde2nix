{
  lib,
  mkKdeDerivation,
  qtsensors,
}:
mkKdeDerivation {
  pname = "kscreen";

  extraBuildInputs = [qtsensors];

  meta.license = [ ];
}
