# kde2nix
Provisional, experimental Plasma 6 (and friends) pre-release packaging [maintainer=@K900]

# Testing
Add this to your flake inputs and include the NixOS module in your config, then `services.xserver.desktopManager.plasma6.enable = true`.

You can also run applications directly from this flake (`nix run github:nix-community/kde2nix#dolphin`).

Non-flake configurations currently require some extra setup (specifically incorporating https://github.com/NixOS/nixpkgs/pull/266868), contributions appreciated.

# Future

This will be upstreamed into nixpkgs after Plasma 6 release, at which point this repo will be deprecated.
