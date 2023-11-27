{
  lib,
  mkKdeDerivation,
  cups,
}:
mkKdeDerivation {
  pname = "print-manager";

  # FIXME: cups-smb?
  extraBuildInputs = [cups];

  meta.license = [ ];
}
