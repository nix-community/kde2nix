{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kjumpingcube";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
