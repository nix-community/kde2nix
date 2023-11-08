{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kmail";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
