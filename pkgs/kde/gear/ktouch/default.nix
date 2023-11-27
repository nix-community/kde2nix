{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "ktouch";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
