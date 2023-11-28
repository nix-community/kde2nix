{
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "konqueror";

  extraBuildInputs = [qtwebengine];
  # FIXME(qt5)
  meta.broken = true;
}
