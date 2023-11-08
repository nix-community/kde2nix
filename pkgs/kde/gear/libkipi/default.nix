{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "libkipi";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
