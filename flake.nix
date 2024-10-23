 {
  description = "RaftDev's Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    stylix = {
      url = "github:danth/stylix/release-24.05"; # Regreet breaks shit
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen - Browser
    zen = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, stylix, sops, ... }@inputs: 
  {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      specialArgs = {
	      inherit inputs;

        pkgs = import nixpkgs {
          config.allowUnfree = true;
          inherit system;
        };

        pkgs-unstable = import nixpkgs-unstable {
          config.allowUnfree = true;
          inherit system;
        };
      };
      
      modules = [
        stylix.nixosModules.stylix
        sops.nixosModules.sops
	      ./hosts/desktop/configuration.nix
      ];
    };
  };
}
