{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "cervisia";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
