{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kig";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
