{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kaccounts-providers";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
