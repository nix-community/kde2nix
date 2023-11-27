{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  qttools,
  pkg-config,
  aspell,
  hunspell,
}:
mkKdeDerivation {
  pname = "sonnet";

  extraBuildInputs = [qtdeclarative aspell hunspell];
  extraNativeBuildInputs = [qttools pkg-config];

  meta.license = [ ];
}
