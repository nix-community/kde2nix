{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "okular";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
