{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Kernel Stuff
  module.kernel.unstable = true;

  # Network
  networking.hostName = "Raft-Laptop"; 
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Hardware
  module.hardware.thermal.enable = true;
  module.kernel.intel.enable = true;

  # Apps
  module.app = {
    gaming.steam.enable = true;
    virtualisation.boxes.enable = true;
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
  };

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
