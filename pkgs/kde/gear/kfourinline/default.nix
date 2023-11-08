{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kfourinline";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
