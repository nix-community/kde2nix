let
  overlay = import ./overlay.nix;
  pkgs = import <nixpkgs> {
    overlays = [overlay];
  };
in
  pkgs
