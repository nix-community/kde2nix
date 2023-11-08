{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kontact";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
