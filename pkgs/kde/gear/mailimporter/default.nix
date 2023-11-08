{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "mailimporter";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
