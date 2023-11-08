{
  stdenv,
  lib,
  fetchurl,
  cmake,
  pkg-config,
  qtbase,
  polkit,
  glib,
  pcre,
  libselinux,
  libsepol,
  util-linux,
}:
stdenv.mkDerivation rec {
  pname = "polkit-qt-1";
  version = "0.175.0";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    sha256 = "sha256-c6MtGhgZaEFF4O+KHy6oBPnsEK141iqgO61NvbOcTJk=";
  };

  cmakeFlags = ["-DQT_MAJOR_VERSION=6"];

  nativeBuildInputs = [cmake pkg-config];

  buildInputs =
    [
      glib
      pcre
      polkit
      qtbase
    ]
    ++ lib.optionals stdenv.isLinux [libselinux libsepol util-linux];

  dontWrapQtApps = true;

  postPatch = ''
    substituteInPlace *.pc.cmake \
      --replace '$'{exec_prefix}/@CMAKE_INSTALL_LIBDIR@ @CMAKE_INSTALL_FULL_LIBDIR@ \
      --replace '$'{prefix}/@CMAKE_INSTALL_INCLUDEDIR@ @CMAKE_INSTALL_FULL_INCLUDEDIR@
  '';

  meta = with lib; {
    description = "A Qt wrapper around PolKit";
    maintainers = with maintainers; [ttuegel];
    platforms = platforms.linux;
  };
}
