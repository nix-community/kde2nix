{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "konqueror";

  extraBuildInputs = [qtwebengine];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
