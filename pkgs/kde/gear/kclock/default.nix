{
  mkKdeDerivation,
  qtsvg,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "kclock";

  extraBuildInputs = [qtsvg qtmultimedia];
  # FIXME(qt5)
  meta.broken = true;
}
