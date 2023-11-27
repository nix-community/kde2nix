{
  lib,
  mkKdeDerivation,
  intltool,
}:
mkKdeDerivation {
  pname = "kaccounts-providers";

  extraNativeBuildInputs = [intltool];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
