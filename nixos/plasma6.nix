self: {
  config,
  lib,
  pkgs,
  utils,
  ...
}: let
  kdePackages = self.packages.${pkgs.stdenv.system};
  xcfg = config.services.xserver;
  cfg = xcfg.desktopManager.plasma6;

  inherit (lib) literalExpression mkDefault mkIf mkOption mkPackageOptionMD types;
in {
  options = {
    services.xserver.desktopManager.plasma6 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = lib.mdDoc "Enable the Plasma 6 (KDE 6) desktop environment.";
      };

      notoPackage = mkPackageOptionMD pkgs "Noto fonts" {
        default = ["noto-fonts"];
        example = "noto-fonts-lgc-plus";
      };
    };

    environment.plasma6.excludePackages = mkOption {
      description = lib.mdDoc "List of default packages to exclude from the configuration";
      type = types.listOf types.package;
      default = [];
      example = literalExpression "[ pkgs.plasma5Packages.oxygen ]";
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.enable -> !config.services.xserver.desktopManager.plasma5.enable;
        message = "Cannot enable plasma5 and plasma6 at the same time!";
      }
    ];

    qt.enable = true;
    environment.systemPackages = with kdePackages; let
      requiredPackages = [
        frameworkintegration
        kauth
        kcmutils
        kconfig
        kconfigwidgets
        kcoreaddons
        kdoctools
        kdbusaddons
        kdeclarative
        kded
        kdesu
        kdnssd
        kfilemetadata
        kglobalaccel
        kguiaddons
        kiconthemes
        kidletime
        kimageformats
        kio
        kjobwidgets
        knewstuff
        knotifications
        knotifyconfig
        kpackage
        kparts
        kpeople
        krunner
        kservice
        ktextwidgets
        kwallet
        kwallet-pam
        kwalletmanager
        kwayland
        pkgs.plasma5Packages.kwayland-integration
        kwidgetsaddons
        kxmlgui
        solid
        sonnet
        threadweaver

        breeze
        plasma-activities
        kactivitymanagerd
        libplasma
        kde-cli-tools
        kdecoration
        kdeplasma-addons
        kgamma
        kscreen
        kscreenlocker
        kwayland
        kwin
        pkgs.xwayland
        kwrited
        libkscreen
        libksysguard
        ksystemstats
        milou
        plasma-integration
        polkit-kde-agent-1

        plasma-desktop
        plasma-workspace
        plasma-workspace-wallpapers
        drkonqi

        breeze-icons
        ocean-sound-theme
        pkgs.hicolor-icon-theme

        kde-gtk-config
        breeze-gtk

        qtvirtualkeyboard
        qtwayland

        pkgs.xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/

        kinfocenter
        kmenuedit
        plasma-systemmonitor
        spectacle
        systemsettings

        dolphin
        dolphin-plugins
        ffmpegthumbs
        kdegraphics-thumbnailers
        kde-inotify-survey
        kio-admin
        kio-extras

        # FIXME: not an overlay because too many rebuilds
        (lib.hiPrio (pkgs.xdg-utils.overrideAttrs (old: {
          patches =
            old.patches
            or []
            ++ [
              # Add KDE6 support
              (pkgs.fetchpatch {
                url = "https://gitlab.freedesktop.org/xdg/xdg-utils/-/merge_requests/67.diff";
                hash = "sha256-DRepY4zZ+AYgEti9qm0gizWoXZZnObcweM5pKLNATh0=";
              })
            ];
        })))
      ];
      optionalPackages = [
        pkgs.aha # needed by kinfocenter for fwupd support
        plasma-browser-integration
        konsole
        (lib.getBin qttools) # Expose qdbus in PATH

        ark
        elisa
        gwenview
        pkgs.plasma5Packages.okular
        khelpcenter
        print-manager
      ];
    in
      requiredPackages
      ++ utils.removePackagesByName optionalPackages config.environment.plasma6.excludePackages
      # Optional hardware support features
      ++ lib.optionals config.hardware.bluetooth.enable [bluedevil bluez-qt pkgs.openobex pkgs.obexftp]
      ++ lib.optional config.networking.networkmanager.enable plasma-nm
      ++ lib.optional config.hardware.pulseaudio.enable plasma-pa
      ++ lib.optional config.services.pipewire.pulse.enable plasma-pa
      ++ lib.optional config.powerManagement.enable powerdevil
      # FIXME: broken
      # ++ lib.optional config.services.colord.enable colord-kde
      ++ lib.optional config.services.hardware.bolt.enable plasma-thunderbolt
      ++ lib.optionals config.services.samba.enable [kdenetwork-filesharing pkgs.samba]
      ++ lib.optional config.services.xserver.wacom.enable wacomtablet
      ++ lib.optional config.services.flatpak.enable flatpak-kcm;

    # Extra services for D-Bus activation
    services.dbus.packages = [
      kdePackages.kactivitymanagerd
    ];

    environment.pathsToLink = [
      # FIXME: modules should link subdirs of `/share` rather than relying on this
      "/share"
    ];

    environment.etc."X11/xkb".source = xcfg.xkb.dir;

    environment.sessionVariables = {
      # Needed for things that depend on other store.kde.org packages to install correctly,
      # notably Plasma look-and-feel packages (a.k.a. Global Themes)
      #
      # FIXME: this is annoyingly impure and should really be fixed at source level somehow,
      # but kpackage is a library so we can't just wrap the one thing invoking it and be done.
      # This also means things won't work for people not on Plasma, but at least this way it
      # works for SOME people.
      KPACKAGE_DEP_RESOLVERS_PATH = "${kdePackages.frameworkintegration.out}/libexec/kf6/kpackagehandlers";
      # FIXME: hack to make things find drkonqi
      LIBEXEC_PATH = "${kdePackages.drkonqi}/libexec";
    };

    # Enable GTK applications to load SVG icons
    services.xserver.gdk-pixbuf.modulePackages = [pkgs.librsvg];

    fonts.packages = with pkgs; [cfg.notoPackage hack-font];
    fonts.fontconfig.defaultFonts = {
      monospace = ["Hack" "Noto Sans Mono"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
    };

    programs.ssh.askPassword = mkDefault "${kdePackages.ksshaskpass.out}/bin/ksshaskpass";

    # Enable helpful DBus services.
    services.accounts-daemon.enable = true;
    # when changing an account picture the accounts-daemon reads a temporary file containing the image which systemsettings5 may place under /tmp
    systemd.services.accounts-daemon.serviceConfig.PrivateTmp = false;
    services.power-profiles-daemon.enable = mkDefault true;
    services.system-config-printer.enable = mkIf config.services.printing.enable (mkDefault true);
    services.udisks2.enable = true;
    services.upower.enable = config.powerManagement.enable;
    services.xserver.libinput.enable = mkDefault true;

    # Extra UDEV rules used by Solid
    services.udev.packages = [
      # libmtp has "bin", "dev", "out" outputs. UDEV rules file is in "out".
      pkgs.libmtp.out
      pkgs.media-player-info
    ];
    # Set up Dr. Konqi as crash handler
    systemd.packages = [kdePackages.drkonqi];
    systemd.services."drkonqi-coredump-processor@".wantedBy = ["systemd-coredump@.service"];
    systemd.user.sockets."drkonqi-coredump-launcher".wantedBy = ["sockets.target"];

    services.xserver.displayManager.sddm = {
      theme = mkDefault "breeze";
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [kdePackages.xdg-desktop-portal-kde];
    xdg.portal.configPackages = mkDefault [kdePackages.xdg-desktop-portal-kde];
    # xdg-desktop-portal-kde expects PipeWire to be running.
    # This does not, by default, replace PulseAudio.
    services.pipewire.enable = mkDefault true;

    programs.firefox.nativeMessagingHosts.packages = [kdePackages.plasma-browser-integration];

    services.xserver.displayManager.sessionPackages = [kdePackages.plasma-workspace];

    services.xserver.displayManager.defaultSession = mkDefault "plasma";

    security.pam.services = {
      login.enableKwallet = true;
      kde.enableKwallet = true;
      # FIXME: do these actually work? https://invent.kde.org/plasma/kscreenlocker/-/merge_requests/163
      kde-fingerprint.fprintAuth = true;
      kde-smartcard.p11Auth = true;
    };

    programs.kdeconnect.package = kdePackages.kdeconnect-kde;

    # FIXME: make this overrideable upstream, also this wrapper is very hacky
    nixpkgs.overlays = [
      (final: prev: {
        libsForQt5 = prev.libsForQt5.overrideScope (_: __: {
          sddm = kdePackages.sddm.overrideAttrs (old: {
            buildInputs = old.buildInputs ++ (with kdePackages; [kirigami qtsvg ksvg plasma5support qt5compat breeze-icons]);
          });
        });
      })
    ];
  };
}
