{
  mkKdeDerivation,
  fetchpatch,
  qtdeclarative,
  spirv-tools,
}:
mkKdeDerivation {
  pname = "kdeclarative";

  # Fix badges
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/kdeclarative/-/commit/5c090f4afc7d1b5a1b841ab9943e6396b3a8d461.patch";
      hash = "sha256-/YEYRxPDe0ygC3Bobzch7FCybjUPRcFe1eohwfelcro=";
    })
  ];

  extraNativeBuildInputs = [spirv-tools];
  extraBuildInputs = [qtdeclarative];
}
