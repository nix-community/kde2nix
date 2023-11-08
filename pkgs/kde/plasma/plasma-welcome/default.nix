{
  lib,
  mkKdeDerivation,
  qtsvg,
  kuserfeedback,
}:
mkKdeDerivation {
  pname = "plasma-welcome";

  extraBuildInputs = [qtsvg kuserfeedback];

  meta.license = null;
}
