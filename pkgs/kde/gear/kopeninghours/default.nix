{
  mkKdeDerivation,
  qtdeclarative,
  bison,
  flex,
  yacc,
  boost,
  python3,
}:
mkKdeDerivation {
  pname = "kopeninghours";

  extraNativeBuildInputs = [bison flex yacc];
  extraBuildInputs = [
    qtdeclarative
    (boost.override {
      enablePython = true;
      python = python3;
    })
  ];
}
