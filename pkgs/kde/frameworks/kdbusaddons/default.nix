{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kdbusaddons";

  extraNativeBuildInputs = [qttools];

  meta.license = [ ];
}
