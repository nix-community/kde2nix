{
  lib,
  mkKdeDerivation,
  pkg-config,
  libraw,
}:
mkKdeDerivation {
  pname = "libkdcraw";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [libraw];

  meta.license = null;
}
