{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-notes";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
