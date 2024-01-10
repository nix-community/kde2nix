{
  mkKdeDerivation,
  sources,
  corrosion,
  xapian,
  rustPlatform,
  cargo,
  rustc,
  # provided as callPackage input to enable easier overrides through overlays
  cargoSha256 ? "sha256-ClmRwSCDXLvK4HdAZ/UX7clj60v4Rh1mUclcnRTQ2rU=",
}:
mkKdeDerivation rec {
  pname = "akonadi-search";
  inherit (sources.${pname}) version;

  cargoRoot = "agent/rs/htmlparser";

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

  extraBuildInputs = [corrosion xapian];
}
