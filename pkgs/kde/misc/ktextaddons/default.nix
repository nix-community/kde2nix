{
  lib,
  mkKdeDerivation,
  fetchurl,
  fetchpatch,
  qtspeech,
  qttools,
  kxmlgui,
}:
mkKdeDerivation rec {
  pname = "ktextaddons";
  version = "1.5.2";

  src = fetchurl {
    url = "mirror://kde/stable/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-KIu7HO+x6LVwo4PHkuul/KKRxG3QFV28JTHwo2aEp9s=";
  };

  # Backport build fix
  # FIXME: remove when updated
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/libraries/ktextaddons/-/commit/733f14eaeaf48a79b0016e5ce3ba237cd543241e.patch";
      excludes = ["textspeechtotext/**"];
      hash = "sha256-586KbHqvs5FjrlAdy+CM4F8YKslgbSo3qUEORw/TlJI=";
    })
  ];

  extraBuildInputs = [qtspeech qttools kxmlgui];

  meta.license = with lib.licenses; [
    bsd3
    cc0
    gpl2Plus
    lgpl2Plus
    lgpl21Plus
  ];
}
