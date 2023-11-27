{
  lib,
  mkKdeDerivation,
  qtmultimedia,
  qtwayland,
  pkg-config,
  wayland,
  wayland-protocols,
  libfakekey,
}:
mkKdeDerivation {
  pname = "kdeconnect-kde";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtmultimedia qtwayland wayland wayland-protocols libfakekey];

  extraCmakeFlags = [
    "-DQtWaylandScanner_EXECUTABLE=${qtwayland}/libexec/qtwaylandscanner"
  ];

  meta.license = null;
}
