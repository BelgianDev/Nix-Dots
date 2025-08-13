{ lib, inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    
    ./raftdev/raftdev.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs pkgs; };
  security.sudo.wheelNeedsPassword = lib.mkDefault true;
}