{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.chat.whatsapp;
in {
  options.module.app.chat.whatsapp = {
    enable = mkEnableOption "Enable Whatsapp.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      whatsie
    ];
  };
}
