{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "lokalize";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
