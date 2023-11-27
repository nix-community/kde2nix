{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kio-gdrive";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
