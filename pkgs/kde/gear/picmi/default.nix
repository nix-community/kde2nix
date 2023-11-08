{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "picmi";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
