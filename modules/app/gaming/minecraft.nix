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
      (prismlauncher.override {
        textToSpeechSupport = false; # STFU Narrator
      })
      (pkgs.callPackage ./../../../pkgs/crafted-launcher-legacy.nix {}) # Custom Launcher
    ];
  };
}
