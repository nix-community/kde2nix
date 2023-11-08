{
  lib,
  mkKdeDerivation,
  qt5compat,
}:
mkKdeDerivation {
  pname = "kfind";

  extraBuildInputs = [qt5compat];

  meta.license = null;
}
