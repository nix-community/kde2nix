{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "krfb";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
