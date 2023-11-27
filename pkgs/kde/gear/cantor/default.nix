{
  lib,
  mkKdeDerivation,
  shared-mime-info,
}:
mkKdeDerivation {
  pname = "cantor";

  extraNativeBuildInputs = [shared-mime-info];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
