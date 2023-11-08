{
  lib,
  mkKdeDerivation,
  qtmultimedia,
  vlc,
}:
mkKdeDerivation {
  pname = "elisa";

  extraBuildInputs = [qtmultimedia vlc];

  meta.license = null;
}
