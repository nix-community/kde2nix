{
  lib,
  mkKdeDerivation,
  qttools,
  gperf,
}:
mkKdeDerivation {
  pname = "kcodecs";

  extraNativeBuildInputs = [qttools];
  extraBuildInputs = [gperf];

  meta.license = [ ];
}
