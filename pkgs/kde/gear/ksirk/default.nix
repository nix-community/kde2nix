{
  lib,
  mkKdeDerivation,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "ksirk";

  extraBuildInputs = [qtmultimedia];

  meta.license = [ ];
}
