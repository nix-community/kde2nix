{
  lib,
  mkKdeDerivation,
  qthttpserver,
  qtsvg,
  qtwebchannel,
  qtwebengine,
  kitemmodels,
  kquickcharts,
}:
mkKdeDerivation {
  pname = "arianna";

  extraBuildInputs = [
    qthttpserver
    qtsvg
    qtwebchannel
    qtwebengine
    kitemmodels
    kquickcharts
  ];

  meta.license = null;
}
