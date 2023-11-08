{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kaccounts-integration";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
