{
  lib,
  mkKdeDerivation,
  qtsvg,
  qqc2-desktop-style,
}:
mkKdeDerivation {
  pname = "calindori";

  extraBuildInputs = [
    qtsvg
    qqc2-desktop-style
  ];

  meta.license = [ ];
  # FIXME(qt5)
  meta.broken = true;
}
