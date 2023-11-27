{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kwidgetsaddons";

  extraNativeBuildInputs = [qttools];

  meta.license = [ ];
}
