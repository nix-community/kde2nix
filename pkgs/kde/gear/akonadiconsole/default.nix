{
  lib,
  mkKdeDerivation,
  xapian,
}:
mkKdeDerivation {
  pname = "akonadiconsole";

  extraBuildInputs = [xapian];

  meta.license = [ ];
}
