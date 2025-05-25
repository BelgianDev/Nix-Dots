{ config, lib, ... }:

with lib;

let
  cfg = config.home.desktop.hyprland;
in {
  options.home.desktop.hyprland = {
    enable = mkEnableOption "Enable Hyprland Desktop Configuration";
  };

  config = mkIf cfg.enable {
    imports = [
      ./hyprland.nix
      ./hyprpaper.nix
      ./waybar.nix
    ];
  };
}
