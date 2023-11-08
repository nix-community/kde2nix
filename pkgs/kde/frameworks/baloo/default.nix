{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  lmdb,
}:
mkKdeDerivation {
  pname = "baloo";

  extraBuildInputs = [qtdeclarative lmdb];

  meta.license = null;
}
