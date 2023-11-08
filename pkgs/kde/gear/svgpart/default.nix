{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "svgpart";

  extraBuildInputs = [qtsvg];

  meta.license = null;
}
