{
  lib,
  mkKdeDerivation,
  intltool,
}:
mkKdeDerivation {
  pname = "kaccounts-providers";

  extraNativeBuildInputs = [intltool];

  meta.license = null;
  # FIXME(qt5)
  meta.broken = true;
}
