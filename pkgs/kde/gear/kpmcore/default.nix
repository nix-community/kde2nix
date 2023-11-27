{
  lib,
  mkKdeDerivation,
  pkg-config,
}:
mkKdeDerivation {
  pname = "kpmcore";

  patches = [
    ./nixostrustedprefix.patch
  ];

  extraNativeBuildInputs = [pkg-config];

  preConfigure = ''
    substituteInPlace src/util/CMakeLists.txt \
      --replace \$\{POLKITQT-1_POLICY_FILES_INSTALL_DIR\} $out/share/polkit-1/actions
    substituteInPlace src/backend/corebackend.cpp \
      --replace /usr/share/polkit-1/actions/org.kde.kpmcore.externalcommand.policy $out/share/polkit-1/actions/org.kde.kpmcore.externalcommand.policy
  '';

  meta.license = [ ];
}
