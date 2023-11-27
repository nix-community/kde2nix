{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kblocks";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
