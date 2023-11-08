{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kalarm";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
