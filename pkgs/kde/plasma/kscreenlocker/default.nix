{
  mkKdeDerivation,
  pam,
}:
mkKdeDerivation {
  pname = "kscreenlocker";

  extraBuildInputs = [pam];
}
