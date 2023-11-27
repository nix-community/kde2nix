{
  lib,
  mkKdeDerivation,
  qtwebengine,
  cyrus_sasl,
}:
mkKdeDerivation {
  pname = "libksieve";

  extraBuildInputs = [qtwebengine cyrus_sasl];

  meta.license = null;
}
