{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "audiotube";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
