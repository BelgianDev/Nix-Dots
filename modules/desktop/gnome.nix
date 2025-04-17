{ config, lib, pkgs, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.gnome = {
    enable = mkEnableOption "Enables the Gnome Desktop Environment.";
    wayland = mkEnableOption "Enables wayland on GDM and Gnome.";
    gdm.enable = mkEnableOption "Enables GDM Display Manager.";
  };

  config = mkIf cfg.enable {
    module.desktop.gdm = true; # Enable GDM

    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
    };

    services.gnome.core-utilities.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    environment.systemPackages = with pkgs-unstable; [
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
