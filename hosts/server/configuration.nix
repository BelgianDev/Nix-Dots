{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules
      ./../../users
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "Raft-Server"; 
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Apps
  module.app = {
    bitwarden.enable = false;
    teams.enable = false;
    wine.enable = false;

    sftp.filezilla.enable = false;
    virtualisation.boxes.enable = false;

    browser = {
      zen.enable = false;
    };

    gaming = {
      steam.enable = false;
      minecraft.enable = false;
      suyu.enable = false;
    };

    dev = {
      java.enable = false;
      rust.enable = false;
      analysis.enable = false;
      docker.enable = true;
    };
  };

  # System
  module.desktop.gnome.enable = false;
  module.kernel = {
    unstable = false; # Use stable kernel
    controller.enable = false;
    nvidia.enable = false;
  };

  module.service.bluetooth.enable = false;

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
