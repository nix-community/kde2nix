{
  lib,
  mkKdeDerivation,
  qtsvg,
  qttools,
  qtwebchannel,
  qtwebengine,
  qt5compat,
  pkg-config,
  hunspell,
}:
mkKdeDerivation {
  pname = "ghostwriter";

  # cross is very broken here
  extraNativeBuildInputs = [qtsvg qttools qtwebchannel qtwebengine qt5compat pkg-config];
  extraBuildInputs = [hunspell];

  meta.license = [ ];
}
