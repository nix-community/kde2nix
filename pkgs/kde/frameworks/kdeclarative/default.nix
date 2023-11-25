{
  lib,
  mkKdeDerivation,
  qtdeclarative,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "kdeclarative";

  # Icons with badges fix
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/frameworks/kdeclarative/-/commit/ec91b2d8b20afd164086f3e5f6d57a4aba1b03d8.patch";
      hash = "sha256-BgDgCjeiU8GSesWmeZ/aS0h90YhBbnu2idrbtlL7aFw=";
    })
  ];

  extraBuildInputs = [qtdeclarative];

  meta.license = null;
}
