{
  lib,
  mkKdeDerivation,
  pkg-config,
  systemd,
  gdb,
  python3,
  substituteAll,
  fetchpatch,
  coreutils,
}: let
  gdb' = gdb.override {
    hostCpuOnly = true;
    python3 = python3.withPackages (ps: [
      ps.psutil
      ps.pygdbmi
      ps.sentry-sdk
    ]);
  };
in
  mkKdeDerivation {
    pname = "drkonqi";

    patches = [
      (substituteAll {
        src = ./gdb-path.patch;
        gdb = "${gdb'}/bin/gdb";
      })
      # Fix GDB preamble crashing if a binary has no build_id
      (fetchpatch {
        url = "https://invent.kde.org/plasma/drkonqi/-/commit/63346248db4b10cd8856f5342c1930d5d347c275.patch";
        hash = "sha256-icb+HsrDAdzAcIf7ZpBSiFqfk7DTPMu/A06c4sLMzD4=";
      })
    ];

    postPatch = ''
      substituteInPlace src/coredump/processor/drkonqi-coredump-pickup.service.cmake \
        --replace /usr/bin/sleep ${coreutils}/bin/sleep
    '';

    extraNativeBuildInputs = [pkg-config];
    extraBuildInputs = [systemd];

    extraCmakeFlags = [
      "-DWITH_GDB12=1"
      "-DWITH_PYTHON_VENDORING=0"
    ];

    meta.license = null;
  }
