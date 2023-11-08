{
  lib,
  mkKdeDerivation,
  qttools,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kholidays";

  extraNativeBuildInputs = [qttools];
  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
