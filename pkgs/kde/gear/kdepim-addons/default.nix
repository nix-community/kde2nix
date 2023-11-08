{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdepim-addons";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
