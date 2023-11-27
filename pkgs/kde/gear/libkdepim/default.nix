{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "libkdepim";

  extraNativeBuildInputs = [qttools];

  meta.license = [ ];
}
