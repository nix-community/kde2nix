{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "lskat";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
