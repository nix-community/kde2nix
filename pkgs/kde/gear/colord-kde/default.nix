{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "colord-kde";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
