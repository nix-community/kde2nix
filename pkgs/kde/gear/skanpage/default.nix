{
  mkKdeDerivation,
  tesseract4,
  leptonica,
}:
mkKdeDerivation {
  pname = "skanpage";

  extraBuildInputs = [tesseract4 leptonica];
}
