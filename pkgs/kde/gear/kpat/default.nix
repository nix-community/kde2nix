{
  mkKdeDerivation,
  qtsvg,
  shared-mime-info,
  black-hole-solver,
  freecell-solver,
  libkdegames,
}:
mkKdeDerivation {
  pname = "kpat";

  extraNativeBuildInputs = [shared-mime-info];
  extraBuildInputs = [
    qtsvg
    black-hole-solver
    freecell-solver
  ];

  qtWrapperArgs = ["--prefix XDG_DATA_DIRS : ${libkdegames}/share"];
}
