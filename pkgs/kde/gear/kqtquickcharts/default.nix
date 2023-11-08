{
  lib,
  mkKdeDerivation,
}:
mkKdeDerivation {
  pname = "kqtquickcharts";

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
