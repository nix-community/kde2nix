{
  mkKdeDerivation,
  qtsvg,
  qtspeech,
}:
mkKdeDerivation {
  pname = "knights";

  extraBuildInputs = [qtsvg qtspeech];
}
