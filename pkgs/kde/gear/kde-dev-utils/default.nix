{
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kde-dev-utils";

  extraBuildInputs = [qttools];
  # FIXME(qt5)
  meta.broken = true;
}
