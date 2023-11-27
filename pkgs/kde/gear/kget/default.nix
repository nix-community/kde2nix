{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kget";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
