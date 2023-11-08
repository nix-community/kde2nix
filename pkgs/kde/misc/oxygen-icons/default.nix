{
  stdenv,
  fetchurl,
  cmake,
  extra-cmake-modules,
  qtbase,
}:
stdenv.mkDerivation rec {
  pname = "oxygen-icons";
  version = "5.245.0";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-sIKhqabQbN7uKGNVWVFgnpXdSZ8TMDXQRxmhb4UASX8=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [qtbase];

  dontWrapQtApps = true;
  dontStrip = true;
}
