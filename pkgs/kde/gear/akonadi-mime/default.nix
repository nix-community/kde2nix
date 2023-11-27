{
  lib,
  mkKdeDerivation,
  shared-mime-info,
}:
mkKdeDerivation {
  pname = "akonadi-mime";

  extraNativeBuildInputs = [shared-mime-info];

  meta.license = null;
}
