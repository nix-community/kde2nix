{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kbounce";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
