{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "breeze";

  extraCmakeFlags = ["-DBUILD_QT5=0"];

  meta.license = [ ];
}
