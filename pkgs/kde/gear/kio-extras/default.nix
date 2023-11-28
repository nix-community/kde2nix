{
  fetchpatch,
  mkKdeDerivation,
  qt5compat,
  qtsvg,
  pkg-config,
  kio-extras-kf6,
  libkexiv2,
  samba,
  libssh,
  libmtp,
  libimobiledevice,
  gperf,
  libtirpc,
  openexr,
  taglib,
  shared-mime-info,
}:
mkKdeDerivation {
  pname = "kio-extras";

  # kio-extras is the KF5 tarball, kio-extras-kf6 is the one we actually want here
  src = kio-extras-kf6.src;

  # Build fixes
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/network/kio-extras/-/commit/7ac6dfd473ef1476b6cb7eb26bc73f874f92155d.diff";
      hash = "sha256-yhcnP1zDAwzJkq3CyHesM53NWhKV47P04vpmAcr/xzQ=";
    })
    (fetchpatch {
      url = "https://invent.kde.org/network/kio-extras/-/commit/65088cdfd9a834117ba9b29fc9be0976bd4ee2c4.diff";
      hash = "sha256-ICmTiHtYoql6Fyq2cEt4ju94lGT5Gd5HIb7fyrrW3iQ=";
    })
  ];

  extraNativeBuildInputs = [pkg-config shared-mime-info];
  extraBuildInputs = [
    qt5compat
    qtsvg
    libkexiv2

    samba
    libssh
    libmtp
    libimobiledevice
    gperf
    libtirpc
    openexr
    taglib
  ];
}
