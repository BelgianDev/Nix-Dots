{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.gnome = {
    enable = mkEnableOption "Enables the Gnome Desktop Environment.";
  };

  config = mkIf cfg.enable {
    module.desktop.gdm.enable = true; # Enable GDM

    services.xserver.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.core-apps.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    environment.systemPackages = with pkgs; [
      # Default Environment apps
      eog
      totem
      nautilus
      gnome-music
      gnome-calculator
      gnome-screenshot
      gnome-disk-utility

      baobab
      gnome-photos

      # Only used to determine settings name, it's recommended to simply modify the nix file, and not settings in these apps directly.
      gnome-tweaks
      gnome-shell-extensions
    ];
  };
}
