{
  mkKdeDerivation,
  fetchpatch,
}:
mkKdeDerivation {
  pname = "dolphin";

  # Fix KActivities
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/system/dolphin/-/commit/9c313813f58cc43acf973464c338b4de56156f1f.patch";
      hash = "sha256-h9F7xKl80afOqJVlTYqkvgnboesy/+t0VMnkeo7zioU=";
    })
  ];
}
