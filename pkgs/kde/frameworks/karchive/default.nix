{
  mkKdeDerivation,
  qttools,
  pkg-config,
  lzma,
}:
mkKdeDerivation {
  pname = "karchive";

  extraNativeBuildInputs = [qttools pkg-config];
  extraBuildInputs = [lzma];
}
