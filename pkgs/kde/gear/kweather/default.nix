{
  mkKdeDerivation,
  fetchpatch,
  qtsvg,
  qtcharts,
  qqc2-desktop-style,
  kholidays,
}:
mkKdeDerivation {
  pname = "kweather";

  # Build fix
  patches = [
    (fetchpatch {
      url = "https://invent.kde.org/utilities/kweather/-/commit/851d28f0f7cee27aecd40a949436e4b73a3afb0f.patch";
      hash = "sha256-hLuYW9eh8KYEJ46H7DLPMRfOOoahD04CucJ88LsM3XE=";
    })
  ];

  extraBuildInputs = [qtsvg qtcharts qqc2-desktop-style kholidays];
}
