{
  mkKdeDerivation,
  qtmultimedia,
  qt5compat,
}:
mkKdeDerivation {
  pname = "konversation";

  extraBuildInputs = [qtmultimedia qt5compat];
}
