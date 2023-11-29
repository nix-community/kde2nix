{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  mpv,
  qtdeclarative,
}:
mkKdeDerivation {
  pname = "mpvqt";
  version = "unstable-2023-11-18";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "libraries";
    repo = "mpvqt";
    rev = "0d0a62b96b75f6baee7b16e0da8795f754836d90";
    hash = "sha256-ym70rqNugZ1ZLd72urJVfDugtsWrZU5Q/dJndsnNqQ0=";
  };

  extraBuildInputs = [mpv qtdeclarative];

  meta.license = with lib.licenses; [bsd2 bsd3 cc-by-sa-40 cc0 lgpl21Only lgpl3Only lgpl3Plus mit];
}
