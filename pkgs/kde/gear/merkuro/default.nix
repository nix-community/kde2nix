{
  lib,
  mkKdeDerivation,
  qtsvg,
  plasma-framework,
}:
mkKdeDerivation {
  pname = "merkuro";

  extraBuildInputs = [qtsvg plasma-framework];

  meta.license = [ ];
}
