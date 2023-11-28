{
  mkKdeDerivation,
  qtsvg,
  qmltermwidget,
}:
mkKdeDerivation {
  pname = "qmlkonsole";

  # FIXME: qmltermwidget is dead, check when sorted
  extraBuildInputs = [qtsvg qmltermwidget];
}
