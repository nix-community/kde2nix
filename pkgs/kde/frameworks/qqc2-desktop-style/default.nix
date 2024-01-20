{
  mkKdeDerivation,
  qtdeclarative,
  sonnet,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "qqc2-desktop-style";

  # fix fractional scaling glitchiness
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/qqc2-desktop-style/-/commit/69eba3a87868c01e919f90cf5e4d4c5069f4ac64.patch";
      hash = "sha256-3ETHoZ65/3yCxqbeH18Gmao3HLpYFZPciqx3OeEpZQ4=";
    })
  ];

  extraBuildInputs = [qtdeclarative];
  extraPropagatedBuildInputs = [sonnet];
}
