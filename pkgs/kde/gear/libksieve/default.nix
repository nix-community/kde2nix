{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "libksieve";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
