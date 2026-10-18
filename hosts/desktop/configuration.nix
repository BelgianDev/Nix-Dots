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

  module.desktop.niri.enable = true; # Tests fails

  # Kernel Stuff
  module.kernel = {
    unstable = false;
  };

  module.secrets = {
    ssh-key = "desktop";
  };


  module.service.wireguard = {
    enable = false;
  };

  services.flatpak.enable = true;

  # No Password for sudo, safe for desktop.
  security.sudo.wheelNeedsPassword = false;

  # Bootloader
  module.kernel.boot.limine = {
    enable = true;
    dual-win = false;
  };

  # Network
  networking.hostName = "Raft-Desktop"; 
  networking.firewall.enable = false; # Fuck the firewall
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    homepage.home.lab 192.168.0.22
  '';

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
        rust.enable = false;
        web.enable = true;
        c.enable = true;
        analysis.enable = true;
        java.enable = true;
      };

      gaming = {
        steam.enable = true;
        switch.enable = true;
      };
    };
  };

  system.stateVersion = "26.05"; # Did you read the comment?
}
