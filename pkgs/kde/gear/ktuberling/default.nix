{
  lib,
  mkKdeDerivation,
  qtmultimedia,
}:
mkKdeDerivation {
  pname = "ktuberling";

  extraBuildInputs = [qtmultimedia];

  meta.license = null;
}
