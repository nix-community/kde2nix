{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-calendar-tools";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
