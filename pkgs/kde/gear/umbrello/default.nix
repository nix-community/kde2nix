{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "umbrello";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
