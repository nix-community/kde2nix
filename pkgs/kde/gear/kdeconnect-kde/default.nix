{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  qtconnectivity,
  qtmultimedia,
  qtwayland,
  pkg-config,
  wayland,
  wayland-protocols,
  libfakekey,
}:
mkKdeDerivation {
  pname = "kdeconnect-kde";
  version = "unstable-2023-11-26";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "network";
    repo = "kdeconnect-kde";
    rev = "b19267598e6115a886fe34c4ff183141454dd2b8";
    hash = "sha256-H85p9e5jLU9FGwBEJXZ6z18Gi3Yfa2sp7pPN3MofDHY=";
  };

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtconnectivity qtmultimedia qtwayland wayland wayland-protocols libfakekey];

  extraCmakeFlags = [
    "-DQtWaylandScanner_EXECUTABLE=${qtwayland}/libexec/qtwaylandscanner"
  ];

  meta.license = null;
}
