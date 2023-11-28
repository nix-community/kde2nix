{
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "libkmahjongg";

  extraBuildInputs = [qtsvg];
}
