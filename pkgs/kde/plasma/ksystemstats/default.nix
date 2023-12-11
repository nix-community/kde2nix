{
  mkKdeDerivation,
  fetchpatch,
  pkg-config,
  libksysguard,
  networkmanager-qt,
  lm_sensors,
  libnl,
}:
mkKdeDerivation {
  pname = "ksystemstats";

  patches = [
    # Fix 100% CPU reported as 0%
    (fetchpatch {
      url = "https://invent.kde.org/plasma/ksystemstats/-/commit/8e7cbc481f30c0155cd78a2d8ed89cee47c3be64.patch";
      hash = "sha256-HHV3vo2VtGF4R10ln1g4jT80Cm6/x2yeYoF2gVpX4kI=";
    })
  ];

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [networkmanager-qt lm_sensors libnl];

  cmakeFlags = ["-DSYSTEMSTATS_DBUS_INTERFACE=${libksysguard}/share/dbus-1/interfaces/org.kde.ksystemstats.xml"];
}
