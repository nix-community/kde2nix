{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kwayland-integration";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
