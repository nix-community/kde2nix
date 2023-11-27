{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "colord-kde";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
