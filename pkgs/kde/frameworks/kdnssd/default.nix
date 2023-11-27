{
  lib,
  mkKdeDerivation,
  qttools,
  avahi,
}:
mkKdeDerivation {
  pname = "kdnssd";

  extraNativeBuildInputs = [qttools];
  extraBuildInputs = [avahi];

  meta.license = [ ];
}
