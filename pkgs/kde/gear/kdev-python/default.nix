{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdev-python";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
