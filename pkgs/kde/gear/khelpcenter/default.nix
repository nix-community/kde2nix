{
  lib,
  mkKdeDerivation,
  qtwebengine,
  xapian,
}:
mkKdeDerivation {
  pname = "khelpcenter";

  extraBuildInputs = [qtwebengine xapian];

  meta.license = [ ];
}
