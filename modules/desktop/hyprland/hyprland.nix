{ config, lib, pkgs, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.hyprland = {
    enable = mkEnableOption "Enables the Hyprland WM";
  };

  config = mkIf cfg.enable {
    module.desktop.gdm.enable = true; # Enable GDM

    programs.hyprland = {
      enable = true;

      package = pkgs-unstable.hyprland;
      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
      rofi
      pkgs-unstable.hyprpaper
    ];
  };
}
