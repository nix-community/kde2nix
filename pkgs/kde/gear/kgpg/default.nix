{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kgpg";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
