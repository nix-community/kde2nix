{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "marble";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
