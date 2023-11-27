{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "oxygen";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
