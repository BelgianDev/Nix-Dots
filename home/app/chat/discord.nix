{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.app.chat.discord;
in {
  options.home.app.chat.discord = {
    enable = mkEnableOption "Enable discord.";
  };

  config = mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
      settings = {
        arRPC = true;
        checkUpdates = false;
      };
    };
  };
}
