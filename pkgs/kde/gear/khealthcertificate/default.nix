{
  lib,
  mkKdeDerivation,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "khealthcertificate";

  extraNativeBuildInputs = [qtdeclarative];

  meta.license = null;
}
