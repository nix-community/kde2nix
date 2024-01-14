let
  overlay = import ./overlay.nix;
in {
  imports = [
    ./nixos/modules/services/x11/desktop-managers/plasma6.nix
  ];

  nixpkgs.overlays = [overlay];
}
