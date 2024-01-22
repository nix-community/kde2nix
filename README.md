# kde2nix
Provisional, experimental Plasma 6 (and friends) pre-release packaging [maintainer=@K900]

# Testing

**Note**: Make sure you are using NixOS unstable. Release branches are not supported and will not work.

A binary cache is available at `nix-community.cachix.org`.

## Flakes

Add this repo to your flake inputs and include the NixOS module in your config, then `services.xserver.desktopManager.plasma6.enable = true`.

You can also run applications directly from this flake (`nix run github:nix-community/kde2nix#dolphin`).

## No flakes

Add this repo as a channel, then include `<kde2nix/nixos.nix>` in your `imports` list.
Adding the repo as a channel can be done with e.g.
```bash
sudo nix-channel --add https://github.com/nix-community/kde2nix/archive/main.tar.gz kde2nix
sudo nix-channel --update kde2nix
```

# Future

This will be upstreamed into nixpkgs after Plasma 6 release, at which point this repo will be deprecated.
