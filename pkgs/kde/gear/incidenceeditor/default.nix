{
  mkKdeDerivation,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "incidenceeditor";

  # Build fixes
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/pim/incidenceeditor/-/commit/d2bda9e3754f7daa8ea876e1d909fe038e03c85b.patch";
      hash = "sha256-8rf8K7yEJQKMa9NJ4qiMiFIilCssgRFNpwjEj1qa5gQ=";
    })
    (fetchpatch {
      url = "https://invent.kde.org/pim/incidenceeditor/-/commit/c64502a92568abe54e27f6d3adfcb1fe84baac4b.patch";
      hash = "sha256-W0EyzWT3maBZYUQE2vWa/eMPlt9IIgTJgiKgldOqwuA=";
    })
  ];
}
