{
  lib,
  mkKdeDerivation,
  boost,
}:
mkKdeDerivation {
  pname = "zanshin";

  extraBuildInputs = [boost];

  meta.license = null;
}
