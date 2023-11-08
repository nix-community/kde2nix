{
  lib,
  mkKdeDerivation,
  qtquick3d,
  pkg-config,
  pipewire,
  ffmpeg,
  mesa,
  libva,
}:
mkKdeDerivation {
  pname = "kpipewire";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtquick3d pipewire ffmpeg mesa libva];

  meta.license = null;
}
