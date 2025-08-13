{ pkgs, ... }:

{
  users.users.raftdev = {
    isNormalUser = true;
    description = "RaftDev";
    extraGroups = [ "raftdev" "networkmanager" "wheel" "docker" "libvirtd" "wireshark" "dialout"];
    shell = pkgs.fish;
  };

  home-manager = {
    users."raftdev" = import ./home.nix;
  };
}