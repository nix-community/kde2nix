{
  lib,
  mkKdeDerivation,
  qgpgme,
}:
mkKdeDerivation {
  pname = "kleopatra";

  extraBuildInputs = [qgpgme];

  meta.license = null;
}
