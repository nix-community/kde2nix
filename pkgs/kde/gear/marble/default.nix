{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "marble";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
