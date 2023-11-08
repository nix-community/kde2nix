{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "akonadi-mime";

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
