{
  lib,
  mkKdeDerivation,
  extra-cmake-modules,
}:
mkKdeDerivation {
  pname = "kross-interpreters";

  extraBuildInputs = [extra-cmake-modules];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
