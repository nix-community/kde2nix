{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kipi-plugins";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
