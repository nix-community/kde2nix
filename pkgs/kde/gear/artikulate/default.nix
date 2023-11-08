{
  lib,
  mkKdeDerivation,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "artikulate";

  extraBuildInputs = [qtmultimedia];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
