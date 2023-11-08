{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kaddressbook";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
