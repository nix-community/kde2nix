{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "korganizer";

  extraBuildInputs = [qttools];

  meta.license = null;
}
