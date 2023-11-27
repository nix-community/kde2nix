{
  lib,
  mkKdeDerivation,
  qttools,
  bison,
  flex,
}:
mkKdeDerivation {
  pname = "solid";

  # Also search /run/wrappers for mount/umount
  patches = [./fix-search-path.patch];

  extraNativeBuildInputs = [qttools bison flex];

  meta.license = [ ];
}
