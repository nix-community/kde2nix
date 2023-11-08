{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadiconsole";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
