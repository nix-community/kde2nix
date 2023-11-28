{
  mkKdeDerivation,
  qtwebview,
  pkg-config,
  flatpak,
  fwupd,
}:
mkKdeDerivation {
  pname = "discover";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [qtwebview flatpak fwupd];
}
