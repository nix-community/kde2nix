{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kmix";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
