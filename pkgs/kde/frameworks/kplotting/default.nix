{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kplotting";

  extraBuildInputs = [qttools];

  meta.license = [ ];
}
