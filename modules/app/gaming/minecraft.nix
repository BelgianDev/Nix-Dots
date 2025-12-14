{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.gaming.minecraft;
in {
  options.module.app.gaming.minecraft = {
    enable = mkEnableOption "Enable Minecraft";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      worldpainter

      (prismlauncher.override {
        textToSpeechSupport = false; # STFU Narrator
      })

      pkgs.local.crafted-launcher-legacy
    ];
  };
}
