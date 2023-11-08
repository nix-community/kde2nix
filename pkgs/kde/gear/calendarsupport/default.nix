{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "calendarsupport";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
