{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kamoso";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
