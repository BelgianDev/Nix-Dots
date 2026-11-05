{ pkgs, inputs, config, ... }:

{
  users.users.raftdev = {
    isNormalUser = true;
    description = "RaftDev";
    extraGroups = [ "raftdev" "networkmanager" "wheel" "docker" "libvirtd" "wireshark" "dialout"];
    shell = pkgs.fish;
    
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKv1p47k2fvfXxTOaJWTYs0+b2ulgTUcItnyinmCRo3t raftdev@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExUPJEwjD0+7/GpI0tKxZx8xBfwH+YoTPR9ZXSbLkM0 raftdev@desktop"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      nixosConfig = config;
    };

    users."raftdev" = import ./home.nix;
  };
}