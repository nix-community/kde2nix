{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kwave";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
