{
  lib,
  mkKdeDerivation,
  qtsvg,
  libGLU,
}:
mkKdeDerivation {
  pname = "kubrick";

  extraBuildInputs = [qtsvg libGLU];

  meta.license = null;
}
