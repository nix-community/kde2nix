{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "ksudoku";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
