{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kglobalaccel";

  extraNativeBuildInputs = [qttools];

  meta.license = null;
}
