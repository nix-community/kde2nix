{
  lib,
  stdenv,
  fetchFromGitHub,
  autoconf,
  automake,
  libtool,
  pkg-config,
  attr,
  fuse,
  lz4,
  lzo,
  xz,
  zlib,
  zstd,
}:
stdenv.mkDerivation rec {
  pname = "squashfuse";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "vasi";
    repo = "squashfuse";
    rev = version;
    hash = "sha256-nCdAO5WPYt/aHdNnfkIJqz0T59COgsSGeXho4bFZVTY=";
  };

  preConfigure = "./autogen.sh";

  nativeBuildInputs = [
    autoconf
    automake
    libtool
    pkg-config
  ];

  buildInputs = [
    attr
    fuse
    lz4
    lzo
    xz
    zlib
    zstd
  ];

  meta = with lib; {
    description = "FUSE filesystem to mount squashfs archives";
    homepage = "https://github.com/vasi/squashfuse";
    changelog = "https://github.com/vasi/squashfuse/blob/${src.rev}/NEWS";
    license = licenses.bsd2;
    maintainers = with maintainers; [];
    mainProgram = "squashfuse";
    platforms = platforms.all;
  };
}
