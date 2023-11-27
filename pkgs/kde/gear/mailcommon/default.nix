{
  lib,
  mkKdeDerivation,
  qtwebengine,
  qttools,
}:
mkKdeDerivation {
  pname = "mailcommon";

  extraBuildInputs = [qtwebengine qttools];

  meta.license = null;
}
