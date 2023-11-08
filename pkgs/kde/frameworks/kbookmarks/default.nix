{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kbookmarks";

  extraNativeBuildInputs = [qttools];

  meta.license = null;
}
