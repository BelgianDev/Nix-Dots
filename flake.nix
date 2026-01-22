 {
  description = "RaftDev's Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen - Browser
    zen = {
     url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, stylix, sops, ... }@inputs: 
    let
      system = "x86_64-linux";

      # base modules that will commonly be used by all systems
      baseModules = [
        ./modules/overlays.nix 
        ./modules
        ./users

        stylix.nixosModules.stylix
        sops.nixosModules.sops
      ];
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        
        specialArgs = { inherit inputs; };
        
        modules = baseModules ++ [
          ./hosts/desktop/configuration.nix
        ];
      };

      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        
        specialArgs = { inherit inputs; };

        modules = baseModules ++ [
          ./hosts/laptop/configuration.nix
        ];
      };
    };
}
