{
  lib,
  mkKdeDerivation,
  qt5compat,
  gmp,
  mpfr,
}:
mkKdeDerivation {
  pname = "kcalc";

  extraBuildInputs = [qt5compat gmp mpfr];

  meta.license = [ ];
}
