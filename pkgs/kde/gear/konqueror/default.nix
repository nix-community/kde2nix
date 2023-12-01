{
  mkKdeDerivation,
  qtwebengine,
  hunspell,
}:
mkKdeDerivation {
  pname = "konqueror";

  extraBuildInputs = [qtwebengine hunspell];
}
