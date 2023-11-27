{
  lib,
  mkKdeDerivation,
  ffmpeg,
}:
mkKdeDerivation {
  pname = "ffmpegthumbs";

  extraBuildInputs = [ffmpeg];

  meta.license = [ ];
}
