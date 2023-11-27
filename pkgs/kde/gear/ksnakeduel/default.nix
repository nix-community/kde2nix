{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "ksnakeduel";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
