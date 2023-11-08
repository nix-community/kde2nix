{
  lib,
  mkKdeDerivation,
  libarchive,
  libzip,
}:
mkKdeDerivation {
  pname = "ark";

  extraBuildInputs = [libarchive libzip];

  meta.license = null;
}
