{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kwave";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
