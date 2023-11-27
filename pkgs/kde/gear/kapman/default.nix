{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kapman";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
