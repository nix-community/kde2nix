{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "pimcommon";

  extraBuildInputs = [qttools];

  meta.license = [ ];
}
