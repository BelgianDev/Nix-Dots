{ config, ... }:

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
  };

  module.service.wireguard = {
    enable = true;
    localAddress = "10.100.0.2/32";
    privateKeyFile = config.sops.secrets."wireguard/desktop/key".path;
  };

  services.flatpak.enable = true;

  # No Password for sudo, safe for desktop.
  security.sudo.wheelNeedsPassword = false;

  # Bootloader
  module.kernel.boot.limine = {
    enable = true;
    dual_win = false;
  };

  # Network
  networking.hostName = "Raft-Desktop"; 
  networking.firewall.enable = false; # Fuck the firewall
  networking.networkmanager.enable = true;

  module = {
    hardware = {
      amd.enable = true;
    };

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
        switch.enable = true;
      };
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
