{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "poxml";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
