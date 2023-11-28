{
  lib,
  stdenv,
  fetchFromGitLab,
  cmake,
  extra-cmake-modules,
  qtbase,
  wrapQtAppsHook,
  qtwayland,
  pkg-config,
  wayland,
  freerdp,
  kpipewire,
}:
stdenv.mkDerivation {
  pname = "krdp";
  version = "unstable-2023-11-02";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "plasma";
    repo = "krdp";
    rev = "2cb36f5a58fd605d81c89fd89fdf98e5becc03e2";
    hash = "sha256-VtytpV9WM/A6s5qw2FcSSbdIp1KIBcQvKGhl6UYBqU0=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    qtwayland
    wayland
    freerdp
    kpipewire
  ];

  meta = with lib; {
    description = "Library and examples for creating an RDP server";
    homepage = "https://invent.kde.org/plasma/krdp";
    license = with licenses; [cc0 lgpl21Only lgpl3Only lgpl3Plus];
    mainProgram = "krdp";
    platforms = platforms.all;
  };
}
