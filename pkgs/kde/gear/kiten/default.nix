{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kiten";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
