{
  generateSplicesForMkScope,
  makeScopeWithSplicing',
  buildEnv,
  fetchurl,
  cmark,
  gpgme,
  lib,
  libsForQt5,
  qt6Packages,
  taglib,
  wayland,
  wayland-protocols,
  zxing-cpp,
}: let
  allPackages = self: let
    frameworks = import ./frameworks {inherit (self) callPackage;};
    gear = import ./gear {inherit (self) callPackage;};
    plasma = import ./plasma {inherit (self) callPackage;};

    readJson = f: builtins.fromJSON (builtins.readFile f);
    sets = ["gear" "frameworks" "plasma"];

    loadUrls = set: readJson (./generated/sources + "/${set}.json");
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

      kquickimageeditor = qt6Packages.kquickimageedit;

      # MISC
      kdiagram = self.callPackage ./misc/kdiagram {};
      kdsoap-ws-discovery-client = self.callPackage ./misc/kdsoap-ws-discovery-client {};
      kirigami-addons = self.callPackage ./misc/kirigami-addons {};
      ktextaddons = self.callPackage ./misc/ktextaddons {};
      krdp = self.callPackage ./misc/krdp {};
      kunifiedpush = self.callPackage ./misc/kunifiedpush {};
      kweathercore = self.callPackage ./misc/kweathercore {};

      mpvqt = self.callPackage ./misc/mpvqt {};

      oxygen-icons = self.callPackage ./misc/oxygen-icons {};

      phonon = self.callPackage ./misc/phonon {};
      plasma-wayland-protocols = libsForQt5.plasma-wayland-protocols;

      polkit-qt-1 = self.callPackage ./misc/polkit-qt-1 {};

      # FIXME: upstream this
      libappimage = self.callPackage ./misc/libappimage {};

      syncthingtray = self.callPackage ./third-party/syncthingtray {};

      # STUBS
      libmediawiki = null; # FIXME: package
      okteta = null; # FIXME: is it dead?
      selenium-webdriver-at-spi = null; # Used for integration tests that we don't run
      qmltermwidget = null; # FIXME: dead?

      # FIXME: hacks for testing
      all = let
        mkAll = set:
          buildEnv {
            name = "all";
            paths = builtins.filter (s: lib.isDerivation s && !s.meta.broken) (builtins.attrValues set);
          };
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
