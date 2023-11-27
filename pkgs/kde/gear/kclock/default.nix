{
  lib,
  mkKdeDerivation,
  qtsvg,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "kclock";

  extraBuildInputs = [qtsvg qtmultimedia];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
