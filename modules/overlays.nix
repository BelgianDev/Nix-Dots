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

  local-overlay = final: _prev: {
    local = import ../pkgs {
      system = final.system;
      pkgs = final;
    };
  };
in

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ nixos-unstable-overlay local-overlay inputs.niri.overlays.niri ];
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