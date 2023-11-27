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

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
