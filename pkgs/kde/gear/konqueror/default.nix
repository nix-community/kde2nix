{
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "konqueror";

  extraBuildInputs = [qtwebengine];
}
