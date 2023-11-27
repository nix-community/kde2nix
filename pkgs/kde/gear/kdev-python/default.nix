{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdev-python";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
