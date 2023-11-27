{
  lib,
  mkKdeDerivation,
  qtsvg,
}:
mkKdeDerivation {
  pname = "kturtle";

  extraBuildInputs = [qtsvg];

  meta.license = [ ];
}
