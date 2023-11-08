{
  lib,
  mkKdeDerivation,
  qtsvg,
  qtwayland,
  wayland,
  pkg-config,
}:
mkKdeDerivation {
  pname = "plasma-framework";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtsvg qtwayland wayland];

  meta.license = null;
}
