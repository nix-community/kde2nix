{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  fetchpatch,
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

  # more qt6 porting
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/network/kdeconnect-kde/-/merge_requests/611.diff";
      hash = "sha256-HiWCK8sxSIvbvfgXX25j9LYoI2uuwStChe3rqnX0KVY=";
      excludes = ["CMakeLists.txt"];
    })
    (fetchpatch {
      url = "https://invent.kde.org/network/kdeconnect-kde/-/merge_requests/612.diff";
      hash = "sha256-asNIIBf9rfU4PcMUMzw8HJjm6uVWdXuU0IocNMHXNAI=";
    })
  ];

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtconnectivity qtmultimedia qtwayland wayland wayland-protocols libfakekey];

  extraCmakeFlags = [
    "-DQtWaylandScanner_EXECUTABLE=${qtwayland}/libexec/qtwaylandscanner"
  ];

  meta.license = null;
}
