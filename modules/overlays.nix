{ inputs, ... }:

let
  mkNixpkgsOverlay = { attrName, over, extraImportArgs ? { } }:
    final: prev: {
      ${attrName} = import over ({
        system = final.system;
        config.allowUnfree = true;
      } // extraImportArgs);
    };

  nixos-unstable-overlay = mkNixpkgsOverlay {
    attrName = "unstable";
    over = inputs.nixpkgs-unstable;
  };
in

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ nixos-unstable-overlay ];
  };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    registry = {
      stable.flake = inputs.nixpkgs;
      unstable.flake = inputs.nixpkgs-unstable;
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "unstable=${inputs.nixpkgs-unstable}"
    ];
  };
}