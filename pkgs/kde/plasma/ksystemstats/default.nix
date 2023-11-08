{
  lib,
  mkKdeDerivation,
  pkg-config,
  networkmanager-qt,
  lm_sensors,
  libnl,
}:
mkKdeDerivation {
  pname = "ksystemstats";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [networkmanager-qt lm_sensors libnl];

  meta.license = null;
  # FIXME: something weird, unused?
  meta.broken = true;
}
