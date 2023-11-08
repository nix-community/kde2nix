{
  lib,
  mkKdeDerivation,
  qtwayland,
  xorg,
}:
mkKdeDerivation {
  pname = "plasma-integration";

  extraCmakeFlags = ["-DBUILD_QT5=0"];

  extraBuildInputs = [qtwayland xorg.libXcursor];

  meta.license = null;
}
