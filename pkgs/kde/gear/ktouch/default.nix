{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "ktouch";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
