{
  lib,
  mkKdeDerivation,
  qtwebengine,
}:
mkKdeDerivation {
  pname = "messagelib";

  extraPropagatedBuildInputs = [qtwebengine];

  meta.license = null;
}
