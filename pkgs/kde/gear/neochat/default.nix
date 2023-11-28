{
  mkKdeDerivation,
  qtlocation,
  qtwebview,
}:
mkKdeDerivation {
  pname = "neochat";

  extraBuildInputs = [qtlocation qtwebview];
}
