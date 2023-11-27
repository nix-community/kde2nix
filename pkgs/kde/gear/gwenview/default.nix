{
  lib,
  mkKdeDerivation,
  qtsvg,
  qtwayland,
  pkg-config,
  cfitsio,
  exiv2,
  baloo,
  lcms2,
  libtiff,
  wayland,
  wayland-protocols,
}:
mkKdeDerivation {
  pname = "gwenview";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [
    qtsvg
    qtwayland

    cfitsio
    exiv2
    baloo
    lcms2
    libtiff
    wayland
    wayland-protocols
  ];

  meta.license = [ ];
}
