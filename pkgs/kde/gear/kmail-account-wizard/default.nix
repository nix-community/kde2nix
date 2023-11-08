{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kmail-account-wizard";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
