{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "krfb";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
