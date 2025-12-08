{ ... }:

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

  # Apps
  module.app = {
    gaming.steam.enable = true;
    virtualisation.boxes.enable = true;
  };

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      extraEntries = ''
        menuentry "Windows" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root $FS_UUID
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # boot.loader.systemd-boot.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
