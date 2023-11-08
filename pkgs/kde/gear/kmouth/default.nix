{
  lib,
  mkKdeDerivation,
  qtspeech,
}:
mkKdeDerivation {
  pname = "kmouth";

  extraBuildInputs = [qtspeech];

  meta.license = null;
}
