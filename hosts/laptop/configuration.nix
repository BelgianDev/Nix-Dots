{ config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Kernel Stuff
  module.kernel.unstable = false;

  # Network
  networking.hostName = "Raft-Laptop"; 
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Hardware
  module.hardware.thermal.enable = true;
  module.kernel.intel.enable = true;

  module.desktop.niri.enable = true;

  module.service.wireguard = {
    enable = true;
    localAddress = "10.100.0.3/32";
    privateKeyFile = config.sops.secrets."wireguard/laptop/key".path;
  };

  # Apps
  module.app = {
    gaming.steam.enable = true;
    virtualisation.boxes.enable = true;

    dev = {
      rust.enable = false;
      web.enable = true;
    };

    creation = {
      aseprite.enable = true;
      blockbench.enable = true;
      audacity.enable = false;
    };
  };

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # boot.loader.systemd-boot.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
