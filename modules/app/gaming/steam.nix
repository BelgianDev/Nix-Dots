{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.gaming.steam;
in {
  options.module.app.gaming.steam = {
    enable = mkEnableOption "Enable Steam Game Launcher.";
  };

  config = mkIf cfg.enable {
    programs.gamescope.enable = true;
    programs.steam.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
