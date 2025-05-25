{ config, lib, ... }:

with lib;

let
  cfg = config.module.app.chat.discord;
in {
  options.module.app.chat.discord = {
    enable = mkEnableOption "Enable discord.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vesktop
    ];
  };
}
