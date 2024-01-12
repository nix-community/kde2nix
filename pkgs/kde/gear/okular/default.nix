{
  mkKdeDerivation,
  pkg-config,
  qtspeech,
  qtsvg,
  poppler,
  libtiff,
  libspectre,
  libzip,
  djvulibre,
  ebook_tools,
  discount,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "okular";

  # Fix not loading
  # FIXME: remove for RC2
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/graphics/okular/-/commit/53fb06d6b4a931b87364a87fcced459b5824b678.patch";
      hash = "sha256-QTfVvIIzE+9lgi8V55BgvUtIh75q14/xHiRt3RIKpZQ=";
    })
    (fetchpatch {
      url = "https://invent.kde.org/graphics/okular/-/commit/478f6f24fbde4657b7bd13dbc4a58512cbd6eb2a.patch";
      hash = "sha256-AnE7E4azjNxp93vDmIG8kJrd1ogSb1+I3olwuyn5n14=";
    })
  ];

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [
    qtspeech
    qtsvg

    poppler
    libtiff
    libspectre
    libzip
    djvulibre
    ebook_tools
    discount
  ];
}
