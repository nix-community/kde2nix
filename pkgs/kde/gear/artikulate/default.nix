{
  lib,
  mkKdeDerivation,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "artikulate";

  extraBuildInputs = [qtmultimedia];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
