{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  sonnet,
}:
mkKdeDerivation {
  pname = "qqc2-desktop-style";

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [sonnet];

  meta.license = null;
}
