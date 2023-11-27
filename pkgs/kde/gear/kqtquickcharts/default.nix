{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kqtquickcharts";

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
