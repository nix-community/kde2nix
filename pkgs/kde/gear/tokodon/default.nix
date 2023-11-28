{
  mkKdeDerivation,
  pkg-config,
  qtmultimedia,
  qtsvg,
  qtwebsockets,
  qtwebview,
  mpv,
  kitemmodels,
  sonnet,
}:
mkKdeDerivation {
  pname = "tokodon";

  extraNativeBuildInputs = [pkg-config];
  # FIXME: kunifiedpush
  extraBuildInputs = [qtmultimedia qtsvg qtwebsockets qtwebview mpv kitemmodels sonnet];
}
