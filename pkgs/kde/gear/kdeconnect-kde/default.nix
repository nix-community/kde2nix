{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdeconnect-kde";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
