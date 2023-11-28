{
  mkKdeDerivation,
  qt5compat,
  boost,
  gmp,
  libgcrypt,
}:
mkKdeDerivation {
  pname = "libktorrent";

  extraBuildInputs = [qt5compat boost gmp libgcrypt];
}
