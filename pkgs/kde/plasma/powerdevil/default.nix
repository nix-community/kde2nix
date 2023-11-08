{
  lib,
  mkKdeDerivation,
  pkg-config,
  libcap,
}:
mkKdeDerivation {
  pname = "powerdevil";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [libcap];

  meta.license = null;
}
