self: {
  lib,
  stdenv,
  makeSetupHook,
  fetchurl,
  cmake,
  qt6,
}: let
  readJson = f: builtins.fromJSON (builtins.readFile f);
  dependencies = (readJson ../generated/dependencies.json).dependencies;
  projectInfo = readJson ../generated/projects.json;

  moveDevHook = makeSetupHook {name = "kf6-move-dev-hook";} ./move-dev-hook.sh;
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
    # FIXME(later): this is wrong for cross, some of these things really need to go into nativeBuildInputs,
    # but cross is currently very broken anyway, so we can figure this out later.
    deps = map (dep: self.${dep}) (dependencies.${pname} or []);

    defaultArgs = {
      inherit version src;

      outputs = ["out" "dev"];

      nativeBuildInputs = [cmake qt6.wrapQtAppsHook moveDevHook] ++ extraNativeBuildInputs;
      buildInputs = [qt6.qtbase] ++ extraBuildInputs;

      # FIXME: figure out what to propagate here
      propagatedBuildInputs = deps ++ extraPropagatedBuildInputs;
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

    cleanArgs = builtins.removeAttrs args [
      "extraBuildInputs"
      "extraNativeBuildInputs"
      "extraPropagatedBuildInputs"
      "extraCmakeFlags"
      "meta"
    ];
  in
    stdenv.mkDerivation (defaultArgs // cleanArgs)
