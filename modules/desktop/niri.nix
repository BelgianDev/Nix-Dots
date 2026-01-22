{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.desktop.niri;
in {
  options.module.desktop.niri = {
    enable = mkEnableOption "Enables the Niri window manager.";
  };

  config = mkIf cfg.enable {
    module.desktop.gdm.enable = true; # Enable GDM
    programs.niri = {
      enable = true;
      package = pkgs.niri-stable;
    };

    environment.systemPackages = with pkgs; [
    
    ];
  };
}
