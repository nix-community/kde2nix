{
  lib,
  stdenv,
  fetchFromGitLab,
  fetchFromGitHub,
  fetchpatch,
  writeText,
  # docs deps
  libxslt,
  docbook_xml_dtd_412,
  docbook_xml_dtd_43,
  docbook_xsl,
  xmlto,
  # runtime deps
  resholve,
  bash,
  coreutils,
  dbus,
  glib,
  file,
  gawk,
  gnugrep,
  gnused,
  jq,
  nettools,
  procmail,
  procps,
  perl,
  perlPackages,
  mimiSupport ? false,
  withXdgOpenUsePortalPatch ? true,
}: let
  # A much better xdg-open
  mimisrc = fetchFromGitHub {
    owner = "march-linux";
    repo = "mimi";
    rev = "8e0070f17bcd3612ee83cb84e663e7c7fabcca3d";
    sha256 = "15gw2nyrqmdsdin8gzxihpn77grhk9l97jp7s7pr7sl4n9ya2rpj";
  };

  # Required by the common desktop detection code
  commonDeps = [dbus coreutils gnugrep gnused];
  commonFakes = [
    "explorer.exe"
    "gnome-default-applications-properties"
    "kde-config"
    "xprop"
  ];

  # This is still required to work around the eval trickery some scripts do
  commonPrologue = "${writeText "xdg-utils-prologue" ''
    export PATH=$PATH:${coreutils}/bin
  ''}";

  solutions = [
    {
      scripts = ["bin/xdg-desktop-icon"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps;
      fake.external =
        commonFakes
        ++ [
          "gconftool-2"
          "xdg-user-dir"
        ];
      keep."$KDE_SESSION_VERSION" = true;
      prologue = commonPrologue;
    }

    {
      scripts = ["bin/xdg-desktop-menu"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [gawk];
      fake.external = commonFakes;
      keep."$KDE_SESSION_VERSION" = true;
      prologue = commonPrologue;
    }

    {
      scripts = ["bin/xdg-email"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [gawk glib.bin "${placeholder "out"}/bin"];
      execer = [
        "cannot:${placeholder "out"}/bin/xdg-mime"
        "cannot:${placeholder "out"}/bin/xdg-open"
      ];
      fake.external =
        commonFakes
        ++ [
          "exo-open"
          "gconftool-2"
          "gio"
          "gnome-open"
          "gvfs-open"
          "qtxdg-mat"
          "xdg-email-hook.sh"
        ];
      fix."/bin/echo" = true;
      keep = {
        "$command" = true;
        "$kreadconfig" = true;
        "$THUNDERBIRD" = true;
        "$utf8" = true;
      };
    }

    {
      scripts = ["bin/xdg-icon-resource"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps;
      fake.external = commonFakes;
      keep."$KDE_SESSION_VERSION" = true;
      prologue = commonPrologue;
    }

    {
      scripts = ["bin/xdg-mime"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [file gawk];
      fake.external =
        commonFakes
        ++ [
          "gio"
          "gnomevfs-info"
          "gvfs-info"
          "kde4-config"
          "kfile"
          "kmimetypefinder"
          "kmimetypefinder5"
          "ktraderclient"
          "ktradertest"
          "mimetype"
          "qtpaths"
          "qtxdg-mat"
        ];
      fix."/usr/bin/file" = true;
      keep = {
        "$KDE_SESSION_VERSION" = true;
        "$KTRADER" = true;
      };
    }

    {
      scripts = ["bin/xdg-open"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [nettools glib.bin "${placeholder "out"}/bin"];
      execer = [
        "cannot:${placeholder "out"}/bin/xdg-mime"
      ];
      fake.external =
        commonFakes
        ++ [
          "cygstart"
          "dde-open"
          "enlightenment_open"
          "env"
          "exo-open"
          "gio"
          "gnome-open"
          "gvfs-open"
          "kde-open"
          "kfmclient"
          "mate-open"
          "mimeopen"
          "open"
          "pcmanfm"
          "qtxdg-mat"
          "run-mailcap"
          "rundll32.exe"
          "wslpath"

          # actually part of a doc string, resholve bug?
          "troublesome"
        ];
      keep = {
        "$browser" = true;
        "$KDE_SESSION_VERSION" = true;
        "$printf" = true;
      };
    }

    {
      scripts = ["bin/xdg-screensaver"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [nettools perl procmail procps];
      fake.external =
        commonFakes
        ++ [
          "dcop"
          "mate-screensaver-command"
          "xautolock"
          "xscreensaver-command"
          "xset"
        ];
      keep = {
        "$lockfile_command" = true;
        "$MV" = true;
        "$XPROP" = true;
      };
      prologue = "${writeText "xdg-screensaver-prologue" ''
        export PERL5LIB=${with perlPackages; makePerlPath [NetDBus XMLTwig XMLParser X11Protocol]}
        export PATH=$PATH:${coreutils}/bin
      ''}";
    }

    {
      scripts = ["bin/xdg-settings"];
      interpreter = "${bash}/bin/bash";
      inputs = commonDeps ++ [jq "${placeholder "out"}/bin"];
      execer = [
        "cannot:${placeholder "out"}/bin/xdg-mime"
      ];
      fake.external =
        commonFakes
        ++ [
          "gconftool-2"
          "kreadconfig"
          "kreadconfig5"
          "kreadconfig6"
          "ktradertest"
          "kwriteconfig"
          "kwriteconfig5"
          "kwriteconfig6"
          "qtxdg-mat"
        ];
      keep = {
        "$KDE_SESSION_VERSION" = true;
        # get_browser_$handler
        "$handler" = true;
      };
    }
  ];
in
  stdenv.mkDerivation rec {
    pname = "xdg-utils";
    version = "1.2.0";

    src = fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "xdg";
      repo = "xdg-utils";
      rev = "v${version}";
      hash = "sha256-rjNIO4B9jHsBmPaugWTMqTGNpjiw0MTEmf9/ds2Mud4=";
    };

    patches =
      [
        # Backport typo fix
        (fetchpatch {
          url = "https://gitlab.freedesktop.org/xdg/xdg-utils/-/commit/af2fe0d1dcbcd982d84ddf2bbd174afe90976ed9.patch";
          hash = "sha256-HhQk06wWkyWjSxjXet+sADKf1irswKxDA8WuOknZKRs=";
        })
      ]
      ++ lib.optionals withXdgOpenUsePortalPatch [
        # Allow forcing the use of XDG portals using NIXOS_XDG_OPEN_USE_PORTAL environment variable.
        # Upstream PR: https://github.com/freedesktop/xdg-utils/pull/12
        ./allow-forcing-portal-use.patch
      ];

    # just needed when built from git
    nativeBuildInputs = [libxslt docbook_xml_dtd_412 docbook_xml_dtd_43 docbook_xsl xmlto];

    # explicitly provide a runtime shell so patchShebangs is consistent across build platforms
    buildInputs = [bash];

    postInstall = lib.optionalString mimiSupport ''
      cp ${mimisrc}/xdg-open $out/bin/xdg-open
    '';

    preFixup = lib.concatStringsSep "\n" (map (resholve.phraseSolution "xdg-utils-resholved") solutions);

    meta = with lib; {
      homepage = "https://www.freedesktop.org/wiki/Software/xdg-utils/";
      description = "A set of command line tools that assist applications with a variety of desktop integration tasks";
      license =
        if mimiSupport
        then licenses.gpl2
        else licenses.mit;
      maintainers = [maintainers.eelco];
      platforms = platforms.all;
    };
  }
