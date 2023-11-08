{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akregator";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
