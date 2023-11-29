{
  mkKdeDerivation,
  qt5compat,
  qtsvg,
  pkg-config,
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
