{
  lib,
  mkKdeDerivation,
  qtsvg,
  qtmultimedia,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "parley";

  extraBuildInputs = [qtsvg qtmultimedia qtwebengine];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
