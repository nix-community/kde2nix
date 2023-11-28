{
  lib,
  mkKdeDerivation,
  cryptsetup,
  lvm2,
  mdadm,
  smartmontools,
  systemdMinimal,
  util-linux,
  btrfs-progs,
  dosfstools,
  e2fsprogs,
  exfatprogs,
  f2fs-tools,
  fatresize,
  hfsprogs,
  jfsutils,
  nilfs-utils,
  ntfs3g,
  reiser4progs,
  reiserfsprogs,
  udftools,
  xfsprogs,
  zfs,
}: let
  # External programs are resolved by `partition-manager` and then
  # invoked by `kpmcore_externalcommand` from `kpmcore` as root.
  # So these packages should be in PATH of `partition-manager`.
  # https://github.com/KDE/kpmcore/blob/06f15334ecfbe871730a90dbe2b694ba060ee998/src/util/externalcommand_whitelist.h,
  runtimeDeps = lib.makeBinPath [
    cryptsetup
    lvm2
    mdadm
    smartmontools
    systemdMinimal
    util-linux

    btrfs-progs
    dosfstools
    e2fsprogs
    exfatprogs
    f2fs-tools
    fatresize
    hfsprogs
    jfsutils
    nilfs-utils
    ntfs3g
    reiser4progs
    reiserfsprogs
    udftools
    xfsprogs
    zfs

    # FIXME: Missing command: hfsck hformat fsck.nilfs2 {fsck,mkfs,debugfs,tunefs}.ocfs2
    # FIXME: audit to see if these are all still required
  ];
in
  mkKdeDerivation {
    pname = "partitionmanager";

    preFixup = ''
      qtWrapperArgs+=(
        "''${gappsWrapperArgs[@]}"
        --prefix PATH : "${runtimeDeps}"
      )
    '';
  }
