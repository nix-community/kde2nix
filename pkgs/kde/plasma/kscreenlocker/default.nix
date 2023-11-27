{
  lib,
  mkKdeDerivation,
  pam,
}:
mkKdeDerivation {
  pname = "kscreenlocker";

  extraBuildInputs = [pam];

  meta.license = [ ];
}
