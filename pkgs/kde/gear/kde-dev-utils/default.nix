{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kde-dev-utils";

  extraBuildInputs = [qttools];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
