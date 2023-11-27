{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "kdeplasma-addons";

  extraBuildInputs = [qtwebengine];

  meta.license = [ ];
}
