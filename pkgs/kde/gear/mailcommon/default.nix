{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "mailcommon";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
