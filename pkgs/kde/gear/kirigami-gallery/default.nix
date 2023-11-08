{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kirigami-gallery";

  extraBuildInputs = [qtsvg];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
