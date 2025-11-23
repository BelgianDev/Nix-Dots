{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.creation.audacity;
in {
  options.module.app.creation.audacity = {
    enable = mkEnableOption "Enable audacity.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      audacity
    ];
  };
}
