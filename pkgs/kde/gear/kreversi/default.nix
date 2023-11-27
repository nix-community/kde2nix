{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kreversi";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
