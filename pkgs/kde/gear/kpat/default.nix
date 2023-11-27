{
  lib,
  mkKdeDerivation,
  qtsvg,
  shared-mime-info,
  black-hole-solver,
  freecell-solver,
}:
mkKdeDerivation {
  pname = "kpat";

  extraNativeBuildInputs = [shared-mime-info];
  extraBuildInputs = [
    qtsvg
    black-hole-solver
    freecell-solver
  ];

  meta.license = [ ];
}
