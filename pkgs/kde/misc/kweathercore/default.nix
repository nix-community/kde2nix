{
  lib,
  mkKdeDerivation,
  fetchFromGitLab,
  qtpositioning,
}:
mkKdeDerivation {
  pname = "kweathercore";
  version = "unstable-2023-11-20";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "libraries";
    repo = "kweathercore";
    rev = "d6408746c3cf7423e4e89ea4a8a9b82f550d789b";
    hash = "sha256-NIOfr+qM05emFcM43BTFOXeHlxmDmH7yOE8hakVdJ28=";
  };

  extraBuildInputs = [qtpositioning];

  meta.license = with lib.licenses; [cc-by-40 cc0 lgpl2Plus];
}
