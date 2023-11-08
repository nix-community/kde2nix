{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kdepim-runtime";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
