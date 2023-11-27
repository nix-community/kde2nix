{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "kquickcharts";

  extraBuildInputs = [qtdeclarative];

  meta.license = [ ];
}
