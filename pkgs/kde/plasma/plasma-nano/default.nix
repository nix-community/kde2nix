{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "plasma-nano";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
