{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "lokalize";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
