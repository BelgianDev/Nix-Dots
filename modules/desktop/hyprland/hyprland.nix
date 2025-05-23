{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.hyprland = {
    enable = mkEnableOption "Enables the Hyprland WM";
  };

  config = mkIf cfg.enable {
    module.desktop.gdm.enable = true; # Enable GDM

    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      rofi
      swaynotificationcenter
      waybar

      pkgs.hyprpolkitagent
      pkgs.hyprpaper
    ];
  };
}
