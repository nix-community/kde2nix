{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "korganizer";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
