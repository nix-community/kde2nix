{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "mbox-importer";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
