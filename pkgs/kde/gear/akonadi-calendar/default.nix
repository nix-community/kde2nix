{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-calendar";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
