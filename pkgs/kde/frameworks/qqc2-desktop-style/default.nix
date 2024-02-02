{
  mkKdeDerivation,
  qtdeclarative,
  sonnet,
}:
mkKdeDerivation {
  pname = "qqc2-desktop-style";

  patches = [./deps.patch];

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [sonnet];
}
