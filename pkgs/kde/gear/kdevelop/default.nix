{
  lib,
  mkKdeDerivation,
  extra-cmake-modules,
}:
mkKdeDerivation {
  pname = "kdevelop";

  extraBuildInputs = [extra-cmake-modules];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
