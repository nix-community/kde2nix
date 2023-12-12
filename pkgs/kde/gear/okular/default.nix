{
  mkKdeDerivation,
  fetchFromGitLab,
  pkg-config,
  qtspeech,
  qtsvg,
  kparts,
  kxmlgui,
  poppler,
  libtiff,
  libspectre,
  libzip,
  djvulibre,
  ebook_tools,
  discount,
}:
mkKdeDerivation {
  pname = "okular";
  version = "unstable-2023-12-12";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "graphics";
    repo = "okular";
    rev = "4ea50e078bad4ad4a1ce9e069cce1191e80616d0";
    hash = "sha256-1NfKYQtFe8qZ2ByU73WXnPnl5qa7BAcSxOu6ZvvsWa8=";
  };

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [
    qtspeech
    qtsvg

    kparts
    kxmlgui

    poppler
    libtiff
    libspectre
    libzip
    djvulibre
    ebook_tools
    discount
  ];
}
