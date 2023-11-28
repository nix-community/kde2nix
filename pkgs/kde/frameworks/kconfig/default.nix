{
  mkKdeDerivation,
  qttools,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kconfig";

  extraNativeBuildInputs = [qttools];
  extraBuildInputs = [qtdeclarative];
}
