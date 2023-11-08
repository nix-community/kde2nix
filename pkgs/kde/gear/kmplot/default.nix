{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kmplot";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
