{
  lib,
  mkKdeDerivation,
  qttools,
}:
mkKdeDerivation {
  pname = "kitemviews";

  extraNativeBuildInputs = [qttools];

  meta.license = null;
}
