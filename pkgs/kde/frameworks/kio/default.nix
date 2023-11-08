{
  lib,
  mkKdeDerivation,
  qt5compat,
  qttools,
  acl,
  attr,
}:
mkKdeDerivation {
  pname = "kio";

  # Remove hardcoded smbd search path
  # FIXME(later): discuss with upstream?
  patches = [./0001-Remove-impure-smbd-search-path.patch];

  extraBuildInputs = [qt5compat qttools acl attr];

  meta.license = null;
}
