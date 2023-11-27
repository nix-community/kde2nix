{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "akregator";

  extraBuildInputs = [qtwebengine];

  meta.license = [ ];
}
