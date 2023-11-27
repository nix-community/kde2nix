{
  lib,
  mkKdeDerivation,
  boost,
}:
mkKdeDerivation {
  pname = "rocs";

  extraBuildInputs = [boost];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
