{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kio-gdrive";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
