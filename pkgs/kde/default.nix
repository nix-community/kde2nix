{
  lib,
  generateSplicesForMkScope,
  makeScopeWithSplicing',
  runCommand,
  fetchurl,
  fetchFromGitLab,
  libsForQt5,
  qt6Packages,
  cmark,
  docbook_xml_dtd_43,
  gpgme,
  taglib,
  wayland-protocols,
  wayland,
  xdg-utils,
  zxing-cpp,
}: let
  allPackages = self: let
    frameworks = import ./frameworks {inherit (self) callPackage;};
    gear = import ./gear {inherit (self) callPackage;};
    plasma = import ./plasma {inherit (self) callPackage;};

    sets = ["gear" "frameworks" "plasma"];

    loadUrls = set: lib.importJSON (./generated/sources + "/${set}.json");
    allUrls = lib.attrsets.mergeAttrsList (map loadUrls sets);

    sources = lib.mapAttrs (_: v:
      (fetchurl {
        inherit (v) url hash;
      })
      // {inherit (v) version;})
    allUrls;
  in (
    qt6Packages
    // frameworks
    // gear
    // plasma
    // {
      inherit sources;

      mkKdeDerivation = self.callPackage (import ./lib/mk-kde-derivation.nix self) {};

      # THIRD PARTY
      inherit
        cmark
        gpgme
        taglib
        wayland
        wayland-protocols
        zxing-cpp
        ;

      # Alias to match metadata
      kquickimageeditor = qt6Packages.kquickimageedit;

      # Alias because it's just data
      plasma-wayland-protocols = libsForQt5.plasma-wayland-protocols;

      # NEWER STABLE RELEASES OF DEPS
      # FIXME: upstream
      kdiagram = self.callPackage ./misc/kdiagram {};
      libappimage = self.callPackage ./misc/libappimage {};

      # UNSTABLE RELEASES
      # These don't have a stable tag that can be upstreamed into nixpkgs yet
      accounts-qt =
        (libsForQt5.accounts-qt.override {
          inherit (qt6Packages) qtbase qmake wrapQtAppsHook;
        })
        .overrideAttrs (_: {
          src = fetchFromGitLab {
            owner = "nicolasfella";
            repo = "libaccounts-qt";
            rev = "18557f7def9af8f4a9e0e93e9f575ae11e5066aa";
            hash = "sha256-8FGZmg2ljSh1DYZfklMTrWN7Sdlk/Atw0qfpbb+GaBc=";
          };
        });
      alpaka = self.callPackage ./misc/alpaka {};
      kdsoap-ws-discovery-client = self.callPackage ./misc/kdsoap-ws-discovery-client {};
      kirigami-addons = self.callPackage ./misc/kirigami-addons {};
      kunifiedpush = self.callPackage ./misc/kunifiedpush {};
      mpvqt = self.callPackage ./misc/mpvqt {};
      oxygen-icons = self.callPackage ./misc/oxygen-icons {};
      polkit-qt-1 = self.callPackage ./misc/polkit-qt-1 {};
      pulseaudio-qt = self.callPackage ./misc/pulseaudio-qt {};

      signond =
        (libsForQt5.signond.override {
          inherit (qt6Packages) qtbase qmake wrapQtAppsHook;
        })
        .overrideAttrs (_: {
          src = fetchFromGitLab {
            owner = "nicolasfella";
            repo = "signond";
            rev = "c8ad98249af541514ff7a81634d3295e712f1a39";
            hash = "sha256-0FcSVF6cPuFEU9h7JIbanoosW/B4rQhFPOq7iBaOdKw=";
          };
        });

      xdg-utils = xdg-utils.overrideAttrs (old: {
        version = "unstable-2023-12-04";

        src = fetchFromGitLab {
          domain = "gitlab.freedesktop.org";
          owner = "xdg";
          repo = "xdg-utils";
          rev = "d4f00e1d803038af4f245949d8c747a384117852";
          hash = "sha256-6s8/3+vsALq8ocAfJ1XBlW9nQhpl2MJ61ueCfjz6tGU=";
        };

        # Intentionally clobber second patch
        patches = [(builtins.head old.patches)];

        buildInputs =
          old.buildInputs
          ++ [
            docbook_xml_dtd_43
          ];
      });

      # MISC FRAMEWORKS WITH KF6 DEPS
      # These have KF6 dependencies so can't be upstreamed without KF6
      ktextaddons = self.callPackage ./misc/ktextaddons {};
      krdp = self.callPackage ./misc/krdp {};
      kweathercore = self.callPackage ./misc/kweathercore {};
      phonon = self.callPackage ./misc/phonon {};

      # THIRD PARTY APPS
      syncthingtray = self.callPackage ./third-party/syncthingtray {};

      # STUBS
      libmediawiki = null; # FIXME: package
      okteta = null; # FIXME: is it dead?
      selenium-webdriver-at-spi = null; # Used for integration tests that we don't run
      qmltermwidget = null; # FIXME: dead?

      # FIXME: hacks for testing
      all = let
        mkAll = set:
          runCommand "all" {
            buildInputs = builtins.filter (s: lib.isDerivation s && !s.meta.broken) (builtins.attrValues set);
          } "touch $out";
      in {
        frameworks = mkAll frameworks;
        gear = mkAll gear;
        plasma = mkAll plasma;
        sources = mkAll sources;
      };
    }
  );
in
  makeScopeWithSplicing' {
    otherSplices = generateSplicesForMkScope "kdePackages";
    f = allPackages;
  }
