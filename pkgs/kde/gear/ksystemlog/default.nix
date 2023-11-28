{
  mkKdeDerivation,
  qt5compat,
}:
mkKdeDerivation {
  pname = "ksystemlog";

  extraBuildInputs = [qt5compat];
}
