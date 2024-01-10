{
  mkKdeDerivation,
  akonadi-contacts,
}:
mkKdeDerivation {
  pname = "kgpg";

  extraBuildInputs = [akonadi-contacts];
  # FIXME: something broken with gpgme
  meta.broken = true;
}
