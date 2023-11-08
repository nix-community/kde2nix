{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "ktorrent";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
