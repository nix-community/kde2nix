{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "pim-data-exporter";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
