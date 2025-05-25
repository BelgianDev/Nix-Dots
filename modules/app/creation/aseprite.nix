{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.creation.aseprite;
in {
  options.module.app.creation.aseprite = {
    enable = mkEnableOption "Enable aseprite.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libresprite
    ];
  };
}
