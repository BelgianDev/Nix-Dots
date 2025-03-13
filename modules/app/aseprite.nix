{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.aseprite;
in {
  options.module.app.aseprite = {
    enable = mkEnableOption "Enable aseprite.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libresprite
    ];
  };
}
