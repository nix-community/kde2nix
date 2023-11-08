{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kget";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
