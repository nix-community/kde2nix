{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "poxml";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
