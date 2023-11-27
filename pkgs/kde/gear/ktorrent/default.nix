{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "ktorrent";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
