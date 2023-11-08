{
  lib,
  mkKdeDerivation,
  libical,
}:
mkKdeDerivation {
  pname = "kcalendarcore";

  extraBuildInputs = [libical];

  meta.license = null;
}
