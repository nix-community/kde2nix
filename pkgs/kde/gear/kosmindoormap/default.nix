{
  lib,
  mkKdeDerivation,
  bison,
  flex,
  yacc,
}:
mkKdeDerivation {
  pname = "kosmindoormap";

  extraNativeBuildInputs = [bison flex yacc];

  meta.license = [ ];
}
