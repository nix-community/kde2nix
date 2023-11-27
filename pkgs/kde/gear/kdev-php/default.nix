{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdev-php";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
