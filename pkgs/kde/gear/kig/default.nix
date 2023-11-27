{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kig";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
