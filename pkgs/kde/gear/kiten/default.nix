{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kiten";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
