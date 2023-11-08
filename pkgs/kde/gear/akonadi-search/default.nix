{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-search";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
