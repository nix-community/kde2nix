{
  lib,
  mkKdeDerivation,
  libgcrypt,
  kdoctools,
}:
mkKdeDerivation {
  pname = "kwallet";

  extraBuildInputs = [libgcrypt kdoctools];

  meta.license = null;
}
