{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kspaceduel";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
