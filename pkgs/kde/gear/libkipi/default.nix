{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "libkipi";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
