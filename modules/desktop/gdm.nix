{ config, lib, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.gdm = {
    enable = mkEnableOption "Enables GDM Display Manager.";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;

      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true; # Always use Wayland
    };
  };
}
