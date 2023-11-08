{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "plasma-workspace-wallpapers";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
