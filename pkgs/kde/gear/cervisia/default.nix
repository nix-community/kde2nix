{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "cervisia";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
