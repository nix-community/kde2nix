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
  cargoSha256 ? "sha256-0bwlPpd741bfH9msKNPOFu7VrhTB7rxOn3d3jjiPqWw=",
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
