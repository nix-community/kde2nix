{
  mkKdeDerivation,
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

  # more qt6 porting
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/network/kdeconnect-kde/-/merge_requests/611.diff";
      hash = "sha256-HiWCK8sxSIvbvfgXX25j9LYoI2uuwStChe3rqnX0KVY=";
      excludes = ["CMakeLists.txt"];
    })
  ];

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtconnectivity qtmultimedia qtwayland wayland wayland-protocols libfakekey];

  extraCmakeFlags = [
    "-DQtWaylandScanner_EXECUTABLE=${qtwayland}/libexec/qtwaylandscanner"
  ];
}
