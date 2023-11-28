{
  lib,
  mkKdeDerivation,
  fetchurl,
}:
mkKdeDerivation rec {
  pname = "kdsoap-ws-discovery-client";
  version = "0.3.0";

  src = fetchurl {
    url = "mirror://kde/unstable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-UAd0fxzmB2ObtjJE+IlMA6FRlMCokbjYXhDXbb33kYg=";
  };

  meta.license = [lib.licenses.gpl3Plus];
}
