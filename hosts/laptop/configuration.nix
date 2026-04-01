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

  # Misc
  module.tool.android.enable = true;

  # Network
  networking.hostName = "Raft-Laptop"; 
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  module.service.dns.enable = true;

  # Hardware
  module.hardware.thermal.enable = true;
  module.kernel.intel.enable = true;

  module.desktop.niri.enable = true;

  module.service.wireguard = {
    enable = true;
    localAddress = "10.0.0.3/32";
    privateKeyFile = config.sops.secrets."wireguard/laptop/key".path;
  };
  
  # Apps
  module.app = {
    gaming.steam.enable = true;
    virtualisation.boxes.enable = false;

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

  module.kernel.boot.limine = {
    enable = true;
    dual-win = true;
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
