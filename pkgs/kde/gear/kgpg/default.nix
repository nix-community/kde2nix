{
  mkKdeDerivation,
  akonadi-contacts,
}:
mkKdeDerivation {
  pname = "kgpg";

  extraBuildInputs = [akonadi-contacts];
  # FIXME: not ported to new akonadi?
  meta.broken = true;
}
