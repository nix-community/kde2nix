{
  lib,
  mkKdeDerivation,
  pkg-config,
  signond,
}:
mkKdeDerivation {
  pname = "signon-kwallet-extension";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [signond];

  meta.license = null;
  # FIXME(signond)
  meta.broken = true;
}
