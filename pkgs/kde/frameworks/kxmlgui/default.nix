{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kxmlgui";

  extraBuildInputs = [qttools];

  meta.license = null;
}
