{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "kimagemapeditor";

  extraBuildInputs = [qtwebengine];

  meta.license = [ ];
}
