{
  mkKdeDerivation,
  qtsvg,
  qtmultimedia,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "parley";

  extraBuildInputs = [qtsvg qtmultimedia qtwebengine];
  # FIXME(qt5)
  meta.broken = true;
}
