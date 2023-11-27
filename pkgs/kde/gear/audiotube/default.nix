{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "audiotube";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
