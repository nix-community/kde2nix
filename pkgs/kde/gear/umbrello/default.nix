{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "umbrello";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
