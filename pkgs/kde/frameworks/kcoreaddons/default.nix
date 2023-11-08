{
  lib,
  mkKdeDerivation,
  qttools,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kcoreaddons";

  extraNativeBuildInputs = [qttools];
  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
