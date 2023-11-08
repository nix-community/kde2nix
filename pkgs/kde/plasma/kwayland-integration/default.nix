{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kwayland-integration";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
