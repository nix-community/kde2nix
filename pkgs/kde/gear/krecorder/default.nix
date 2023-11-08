{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "krecorder";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
