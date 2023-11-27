{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "yakuake";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
