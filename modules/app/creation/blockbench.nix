{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.creation.blockbench;
in {
  options.module.app.creation.blockbench = {
    enable = mkEnableOption "Enable aseprite.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      blockbench
    ];
  };
}
