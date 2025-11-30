{ config, lib, ... }:

with lib;

let
  cfg = config.module.desktop.gnome;
in {
  options.module.desktop.gdm = {
    enable = mkEnableOption "Enables GDM Display Manager.";
  };

  config = mkIf cfg.enable {
    services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
