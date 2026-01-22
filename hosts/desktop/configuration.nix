{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  module.wine.enable = true;
  module.tool.android.enable = true;

  module.desktop.niri.enable = false; # Tests fails

  # Kernel Stuff
  module.kernel = {
    unstable = false;
    nvidia = {
      enable = true;
      open = false;
      settings = false;
    };
  };

  services.flatpak.enable = true;

  # No Password for sudo, safe for desktop.
  security.sudo.wheelNeedsPassword = false;

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

  # Network
  networking.hostName = "Raft-Desktop"; 
  networking.firewall.enable = false; # Fuck the firewall
  networking.networkmanager.enable = true;

  module = {
    app = {
      creation = {
        aseprite.enable = true;
        blockbench.enable = true;
        audacity.enable = true;
      };

      dev = {
        rust.enable = true;
        web.enable = true;
        c.enable = true;
      };

      gaming = {
        steam.enable = true;
      };
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
