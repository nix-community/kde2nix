{
  lib,
  mkKdeDerivation,
  kactivities,
  libssh,
  libvncserver,
  freerdp,
}:
mkKdeDerivation {
  pname = "krdc";

  extraBuildInputs = [kactivities libssh libvncserver];

  qtWrapperArgs = [
    "--prefix PATH ':' ${lib.makeBinPath [
      freerdp
    ]}"
  ];

  meta.license = [ ];
}
