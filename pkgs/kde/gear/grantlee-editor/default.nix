{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "grantlee-editor";

  extraBuildInputs = [qtwebengine];

  meta.license = [ ];
}
