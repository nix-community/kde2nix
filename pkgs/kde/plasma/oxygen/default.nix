{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "oxygen";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
