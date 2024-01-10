{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
}:
mkKdeDerivation {
  pname = "alpaka";
  version = "unstable-2024-01-10";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "utilities";
    repo = "alpaka";
    rev = "4753d2b21363b600809e19b2d104f6951d0ca13e";
    hash = "sha256-9cnXTBVR9HM9BHZcI/i3SdB13B/nSlyGjmSHqiFxpMA=";
  };

  meta.license = with lib.licenses; [
    bsd3
    cc0
    gpl2Only
    gpl2Plus
    gpl3Only
  ];
}
