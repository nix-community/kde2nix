{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kconfigwidgets";

  extraBuildInputs = [qttools];

  meta.license = [ ];
}
