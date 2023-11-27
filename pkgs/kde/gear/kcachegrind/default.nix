{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kcachegrind";

  extraNativeBuildInputs = [qttools];

  meta.license = [ ];
}
