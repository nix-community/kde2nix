{
  lib,
  mkKdeDerivation,
  fetchpatch,
  substituteAll,
  xorg,
  pkg-config,
  spirv-tools,
  qtsvg,
  qtwayland,
  libcanberra,
  libqalculate,
  pipewire,
  breeze,
  qttools,
}:
mkKdeDerivation {
  pname = "plasma-workspace";

  patches = [
    (substituteAll {
      src = ./tool-paths.patch;
      xmessage = "${lib.getBin xorg.xmessage}/bin/xmessage";
      xsetroot = "${lib.getBin xorg.xsetroot}/bin/xsetroot";
      qdbus = "${lib.getBin qttools}/bin/qdbus";
    })
    (substituteAll {
      src = ./wallpaper-paths.patch;
      wallpapers = "${lib.getBin breeze}/share/wallpapers";
    })
    (fetchpatch {
      url = "https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/3646.diff";
      hash = "sha256-gUti+VZuQgjVpjr3Oj6zbFra0tNyICFsG8aZRGdIv4g=";
    })
  ];

  extraNativeBuildInputs = [pkg-config spirv-tools];
  extraBuildInputs = [
    qtsvg
    qtwayland

    libcanberra
    libqalculate
    pipewire

    xorg.libSM
    xorg.libXcursor
    xorg.libXtst
    xorg.libXft
  ];

  passthru.providedSessions = ["plasma" "plasmax11"];
}
