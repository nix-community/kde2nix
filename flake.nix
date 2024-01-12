{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/staging-next";
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    pre-commit-hooks,
  }:
    (flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python3.withPackages (ps: [
          ps.beautifulsoup4
          ps.click
          ps.httpx
          ps.jinja2
          ps.pyyaml
        ]);
      in rec {
        legacyPackages = (self.overlays.default pkgs pkgs).kdePackages;
        packages = legacyPackages;

        checks.pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [python pkgs.gnutar pkgs.jq pkgs.reuse];
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };
      }
    ))
    // {
      overlays.default = import ./overlay.nix;

      nixosModules = rec {
        plasma6 = import ./nixos.nix;
        default = plasma6;
      };

      nixosConfigurations.test-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          self.nixosModules.plasma6
          {
            users.users.nixos = {
              isNormalUser = true;
              password = "nixos";
            };

            services.xserver.enable = true;
            services.xserver.displayManager.sddm.enable = true;
            services.xserver.desktopManager.plasma6.enable = true;
          }
        ];
      };
    };
}
