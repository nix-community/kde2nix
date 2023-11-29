{
  lib,
  mkKdeDerivation,
  fetchurl,
}:
mkKdeDerivation rec {
  pname = "oxygen-icons";
  version = "5.245.0";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-sIKhqabQbN7uKGNVWVFgnpXdSZ8TMDXQRxmhb4UASX8=";
  };

  dontStrip = true;

  meta.license = [lib.licenses.lgpl3Plus];
}
