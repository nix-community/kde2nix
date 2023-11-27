{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "juk";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
