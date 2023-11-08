{
  lib,
  mkKdeDerivation,
  libcanberra,
}:
mkKdeDerivation {
  pname = "knotifyconfig";

  extraBuildInputs = [libcanberra];

  meta.license = null;
}
