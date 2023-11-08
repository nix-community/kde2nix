{
  lib,
  mkKdeDerivation,
  pkg-config,
  systemd,
  python3,
}:
mkKdeDerivation {
  pname = "drkonqi";

  extraNativeBuildInputs = [pkg-config];
  extraBuildInputs = [
    systemd
    (python3.withPackages (ps: [
      ps.psutil
      ps.pygdbmi
      ps.sentry-sdk
    ]))
  ];

  # FIXME: figure out the GDB preamble nonsense
  extraCmakeFlags = [
    "-DWITH_GDB12=1"
    "-DWITH_PYTHON_VENDORING=0"
  ];

  meta.license = null;
}
