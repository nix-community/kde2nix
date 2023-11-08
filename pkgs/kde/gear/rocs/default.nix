{
  lib,
  mkKdeDerivation,
  boost,
}:
mkKdeDerivation {
  pname = "rocs";

  extraBuildInputs = [boost];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
