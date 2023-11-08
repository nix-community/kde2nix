{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "juk";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
