{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "konqueror";

  extraBuildInputs = [qtwebengine];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
