{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-contacts";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
