{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdev-php";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
