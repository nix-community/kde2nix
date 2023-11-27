{
  lib,
  mkKdeDerivation,
  sources,
  qtsvg,
  qtwebengine,
  corrosion,
  rustPlatform,
  cargo,
  rustc,
  # provided as callPackage input to enable easier overrides through overlays
  cargoSha256 ? "sha256-qY5VB9cAe9AR7IpAKppPK9cBYU5fTgeHuahPQ86lhoQ=",
  qcoro,
}:
mkKdeDerivation rec {
  pname = "angelfish";
  inherit (sources.${pname}) version;

  cargoDeps = rustPlatform.fetchCargoTarball {
    # include version in the name so we invalidate the FOD
    name = "${pname}-${version}";
    src = sources.${pname};
    sha256 = cargoSha256;
  };

  extraNativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  extraBuildInputs = [corrosion qtsvg qtwebengine qcoro];

  meta.license = [ ];
}
