{
  lib,
  mkKdeDerivation,
  shared-mime-info,
}:
mkKdeDerivation {
  pname = "cantor";

  extraNativeBuildInputs = [shared-mime-info];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
