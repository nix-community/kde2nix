{
  lib,
  mkKdeDerivation,
  qtsvg,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "kclock";

  extraBuildInputs = [qtsvg qtmultimedia];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
