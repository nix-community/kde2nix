{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "libgravatar";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
