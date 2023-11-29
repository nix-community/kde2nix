{
  mkKdeDerivation,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "eventviews";

  # Build fix
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/pim/eventviews/-/commit/601f88f1d05f00e621976be58d170355caa29fdd.patch";
      hash = "sha256-nyo/l86p6ljWi629Pp6vh26oRBCffR/VaQrf+b4aTyw=";
    })
  ];
}
