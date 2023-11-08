{
  lib,
  mkKdeDerivation,
  qt5compat,
  qtdeclarative,
  qgpgme,
}:
mkKdeDerivation {
  pname = "mimetreeparser";

  extraBuildInputs = [qt5compat qtdeclarative qgpgme];

  meta.license = null;
}
