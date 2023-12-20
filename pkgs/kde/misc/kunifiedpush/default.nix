{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  qtwebsockets,
  kdeclarative,
  kpackage,
}:
mkKdeDerivation {
  pname = "kunifiedpush";
  version = "unstable-2023-11-26";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "libraries";
    repo = "kunifiedpush";
    rev = "83064e6feea25a3b2422b8cfffdf631f0242430d";
    hash = "sha256-xysFgF+IH1Ak1/REJ4PsVVTPxtZ7SA58khZArEmrRyY=";
  };

  extraBuildInputs = [qtwebsockets kdeclarative kpackage];

  meta.license = with lib.licenses; [bsd2 bsd3 cc0 lgpl2Plus];
}
