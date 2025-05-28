{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  users.users.raftdev = {
    isNormalUser = true;
    description = "RaftDev";
    extraGroups = [ "raftdev" "networkmanager" "wheel" "docker" "libvirtd" "wireshark" "dialout"];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users."raftdev" = import ./home.nix;
  };
}