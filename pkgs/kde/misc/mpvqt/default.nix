{
  stdenv,
  fetchFromGitLab,
  cmake,
  extra-cmake-modules,
  mpv,
  qtbase,
  qtdeclarative,
}:
stdenv.mkDerivation {
  pname = "mpvqt";
  version = "unstable-2023-11-18";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "libraries";
    repo = "mpvqt";
    rev = "0d0a62b96b75f6baee7b16e0da8795f754836d90";
    hash = "sha256-ym70rqNugZ1ZLd72urJVfDugtsWrZU5Q/dJndsnNqQ0=";
  };

  dontWrapQtApps = true;

  cmakeFlags = ["-DQT_MAJOR_VERSION=6"];

  nativeBuildInputs = [cmake extra-cmake-modules];
  buildInputs = [mpv qtbase qtdeclarative];
}
