{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.module.app.gaming.steam;
in {
  options.module.app.gaming.steam = {
    enable = mkEnableOption "Enable Steam Game Launcher.";
  };

  config = mkIf cfg.enable {
    programs.steam.enable = true;
    programs.gamemode.enable = true;
  };
}
