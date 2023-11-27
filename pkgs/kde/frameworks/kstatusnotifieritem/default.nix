{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kstatusnotifieritem";

  extraNativeBuildInputs = [qttools];

  meta.license = [ ];
}
