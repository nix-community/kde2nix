{
  lib,
  mkKdeDerivation,
  substituteAll,
  xorg,
  pkg-config,
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
  ];

  extraNativeBuildInputs = [pkg-config];
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

  meta.license = [ ];
}
