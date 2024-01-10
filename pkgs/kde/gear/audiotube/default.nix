{
  mkKdeDerivation,
  qtdeclarative,
  qtmultimedia,
  qtsvg,
  extra-cmake-modules,
  futuresql,
  kcoreaddons,
  kcrash,
  ki18n,
  kirigami-addons,
  kirigami,
  kwindowsystem,
  qcoro,
  python3,
}:
mkKdeDerivation {
  pname = "audiotube";

  extraBuildInputs = [
    qtdeclarative
    qtmultimedia
    qtsvg

    extra-cmake-modules
    futuresql
    kirigami
    kirigami-addons
    kcoreaddons
    ki18n
    kcrash
    kwindowsystem
    qcoro

    (python3.withPackages (ps: [
      ps.pybind11
      ps.yt-dlp
      ps.ytmusicapi
    ]))
  ];
}
