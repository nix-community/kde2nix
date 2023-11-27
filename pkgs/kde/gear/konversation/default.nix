{
  lib,
  mkKdeDerivation,
  qtmultimedia,
  qt5compat,
}:
mkKdeDerivation {
  pname = "konversation";

  extraBuildInputs = [qtmultimedia qt5compat];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
