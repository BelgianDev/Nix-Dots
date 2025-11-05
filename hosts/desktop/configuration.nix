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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "Raft-Desktop"; 
  networking.firewall.enable = false; # Fuck the firewall
  networking.networkmanager.enable = true;

  # Apps
  module.app.creation.aseprite.enable = true;
  module.app.creation.blockbench.enable = true;
  module.app.gaming.steam.enable = true;
  module.app.gaming.switch.enable = true;
  module.app.virtualisation.boxes.enable = true;

  module.app.winboat.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
