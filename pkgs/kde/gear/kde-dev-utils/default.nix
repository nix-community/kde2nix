{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kde-dev-utils";

  extraBuildInputs = [qttools];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
