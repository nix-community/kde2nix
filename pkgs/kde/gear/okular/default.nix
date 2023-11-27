{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "okular";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
