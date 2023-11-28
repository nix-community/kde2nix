{
  mkKdeDerivation,
  intltool,
}:
mkKdeDerivation {
  pname = "kaccounts-providers";

  extraNativeBuildInputs = [intltool];
  # FIXME(qt5)
  meta.broken = true;
}
