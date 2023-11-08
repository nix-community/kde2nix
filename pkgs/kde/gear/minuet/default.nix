{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  qtsvg,
  fluidsynth,
}:
mkKdeDerivation {
  pname = "minuet";

  extraBuildInputs = [qtdeclarative qtsvg fluidsynth];

  meta.license = null;
}
