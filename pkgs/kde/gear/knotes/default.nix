{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "knotes";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
