{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kmix";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
