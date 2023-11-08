{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-import-wizard";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
