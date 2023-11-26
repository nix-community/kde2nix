self: {
  lib,
  stdenv,
  fetchurl,
  cmake,
  qt6,
}: let
  readJson = f: builtins.fromJSON (builtins.readFile f);
  dependencies = (readJson ../generated/dependencies.json).dependencies;
  projectInfo = readJson ../generated/projects.json;

  alwaysNativeBuildInputs = ["extra-cmake-modules"];
  pluckDeps = builtins.map (dep: self.${dep});
in
  {
    pname,
    version ? self.sources.${pname}.version,
    src ? self.sources.${pname},
    extraBuildInputs ? [],
    extraNativeBuildInputs ? [],
    extraPropagatedBuildInputs ? [],
    extraCmakeFlags ? [],
    meta ? {},
    ...
  } @ args: let
    splitDeps = builtins.partition (dep: builtins.elem dep alwaysNativeBuildInputs) (dependencies.${pname} or []);
    nativeDeps = pluckDeps splitDeps.right;
    hostDeps = pluckDeps splitDeps.wrong;

    defaultArgs = {
      inherit pname version src;

      # FIXME: move designer plugins to dev
      outputs = ["out" "dev"];

      nativeBuildInputs = [cmake qt6.wrapQtAppsHook] ++ nativeDeps ++ extraNativeBuildInputs;

      # FIXME: remove ECM
      buildInputs = [qt6.qtbase] ++ nativeDeps ++ extraBuildInputs;

      # FIXME: figure out what to propagate here
      propagatedBuildInputs = hostDeps ++ extraPropagatedBuildInputs;
      strictDeps = true;

      cmakeFlags = ["-DQT_MAJOR_VERSION=6"] ++ extraCmakeFlags;

      separateDebugInfo = true;

      meta =
        {
          description = projectInfo.${pname}.description;
          homepage = "https://invent.kde.org/${projectInfo.${pname}.repo_path}";
        }
        // meta;
    };

    cleanArgs = builtins.removeAttrs args ["extraBuildInputs" "extraNativeBuildInputs" "meta"];
  in
    stdenv.mkDerivation (defaultArgs // cleanArgs)
