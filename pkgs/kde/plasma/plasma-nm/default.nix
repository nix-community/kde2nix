{
  lib,
  mkKdeDerivation,
  substituteAll,
  pkg-config,
  openvpn,
}:
mkKdeDerivation {
  pname = "plasma-nm";

  patches = [
    (substituteAll {
      src = ./0002-openvpn-binary-path.patch;
      inherit openvpn;
    })
  ];

  extraNativeBuildInputs = [pkg-config];

  meta.license = [ ];
}
