{
  mkKdeDerivation,
  qtdeclarative,
  qtsvg,
  openal,
  libsndfile,
}:
mkKdeDerivation {
  pname = "libkdegames";

  extraBuildInputs = [openal libsndfile qtdeclarative qtsvg];
}
