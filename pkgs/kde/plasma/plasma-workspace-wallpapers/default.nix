{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "plasma-workspace-wallpapers";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
