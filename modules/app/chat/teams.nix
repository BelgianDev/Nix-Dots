{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.chat.teams;
in {
  options.module.app.chat.teams = {
    enable = mkEnableOption "Enable Microshit Teams.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      teams-for-linux
    ];
  };
}
