{
  lib,
  mkKdeDerivation,
  qt5compat,
  boost,
  qgpgme,
}:
mkKdeDerivation {
  pname = "libkleo";

  extraBuildInputs = [qt5compat boost qgpgme];

  meta.license = null;
}
