{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kamoso";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
