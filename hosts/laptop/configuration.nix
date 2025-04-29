{ pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules
      ./../../users
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Kernel Stuff
  module.kernel.unstable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "Raft-Laptop"; 
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  # Apps
  module.app.mqtt.enable = true;
  module.app.gaming.steam.enable = true;
  module.app.gaming.minecraft.enable = true;
  module.app.dev.c.enable = true;
  module.app.dev.web.enable = true;
  module.app.dev.python.enable = true;
  module.app.dev.rust.enable = true;
  module.app.virtualisation.boxes.enable = true;

  boot.kernelParams = [ "button.lid_init_state=open" ];
  services.logind.extraConfig = "HandleLidSwitch=ignore";

  # Forced Apps - Temporary
  environment.systemPackages = with pkgs; [
    vesktop
    pkgs-unstable.responsively-app

    whatsie
  ];

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";
    LC_IDENTIFICATION = "fr_BE.UTF-8";
    LC_MEASUREMENT = "fr_BE.UTF-8";
    LC_MONETARY = "fr_BE.UTF-8";
    LC_NAME = "fr_BE.UTF-8";
    LC_NUMERIC = "fr_BE.UTF-8";
    LC_PAPER = "fr_BE.UTF-8";
    LC_TELEPHONE = "fr_BE.UTF-8";
    LC_TIME = "fr_BE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "be";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "be-latin1";

  system.stateVersion = "24.11"; # Did you read the comment?
}
