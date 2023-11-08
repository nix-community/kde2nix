{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kongress";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
