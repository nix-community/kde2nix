{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "krecorder";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
