{
  lib,
  mkKdeDerivation,
  qtwebchannel,
  qtwebengine,
  qttools,
  libpcap,
  libnl,
  lm_sensors,
}:
mkKdeDerivation {
  pname = "libksysguard";

  # FIXME(later): upstream
  patches = [./0001-qdiriterator-follow-symlinks.patch];

  extraBuildInputs = [qtwebchannel qtwebengine qttools libpcap libnl lm_sensors];

  meta.license = [ ];
}
