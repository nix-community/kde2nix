{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "messagelib";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
