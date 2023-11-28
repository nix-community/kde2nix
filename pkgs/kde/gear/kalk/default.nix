{
  mkKdeDerivation,
  qtdeclarative,
  qqc2-desktop-style,
  kirigami-addons,
  bison,
  flex,
  gmp,
  mpfr,
}:
mkKdeDerivation {
  pname = "kalk";

  extraNativeBuildInputs = [bison flex];
  extraBuildInputs = [
    qtdeclarative
    qqc2-desktop-style
    kirigami-addons
    gmp
    mpfr
  ];
}
