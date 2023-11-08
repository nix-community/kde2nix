{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kcompletion";

  extraNativeBuildInputs = [qttools];

  meta.license = null;
}
