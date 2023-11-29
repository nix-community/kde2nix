{
  mkKdeDerivation,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "kalarm";

  # Build fix
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/pim/kalarm/-/commit/d0998827b0fd5ce761957d0c57296975bd383d97.patch";
      hash = "sha256-mZKxjZTAFhG1D49wLSxecya3v5k/9VIR9cd0WRUWZms=";
    })
  ];
}
