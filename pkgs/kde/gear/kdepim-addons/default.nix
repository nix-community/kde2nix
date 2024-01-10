{
  mkKdeDerivation,
  sources,
  rustPlatform,
  cargo,
  rustc,
  corrosion,
  discount,
  alpaka,
  # provided as callPackage input to enable easier overrides through overlays
  cargoSha256 ? "sha256-Dwq7Oisxs6O1sE+Z8NyU7NTGFc5yMRDxP+5kICvge4o=",
}:
mkKdeDerivation rec {
  pname = "kdepim-addons";

  inherit (sources.${pname}) version;

  cargoRoot = "plugins/webengineurlinterceptor/adblock";

  cargoDeps = rustPlatform.fetchCargoTarball {
    # include version in the name so we invalidate the FOD
    name = "${pname}-${version}";
    src = sources.${pname};
    sourceRoot = "${pname}-${version}/${cargoRoot}";
    sha256 = cargoSha256;
  };

  extraNativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  extraBuildInputs = [corrosion discount alpaka];
}
