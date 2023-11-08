{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kipi-plugins";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
