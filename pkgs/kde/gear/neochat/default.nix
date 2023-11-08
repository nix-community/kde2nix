{
  lib,
  mkKdeDerivation,
  qtlocation,
  qtwebview,
}:
mkKdeDerivation {
  pname = "neochat";

  extraBuildInputs = [qtlocation qtwebview];

  meta.license = null;
}
