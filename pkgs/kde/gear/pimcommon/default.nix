{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "pimcommon";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
