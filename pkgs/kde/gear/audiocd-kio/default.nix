{
  lib,
  mkKdeDerivation,
  cdparanoia,
  flac,
  libogg,
  libvorbis,
}:
# FIXME: hardcode lame path
mkKdeDerivation {
  pname = "audiocd-kio";

  extraBuildInputs = [cdparanoia flac libogg libvorbis];

  meta.license = null;
}
