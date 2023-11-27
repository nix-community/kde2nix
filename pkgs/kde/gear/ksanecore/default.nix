{
  lib,
  mkKdeDerivation,
  sane-backends,
}:
mkKdeDerivation {
  pname = "ksanecore";

  extraBuildInputs = [sane-backends];

  meta.license = [ ];
}
