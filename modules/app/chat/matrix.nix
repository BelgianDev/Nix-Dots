{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.chat.matrix;
in {
  options.module.app.chat.matrix = {
    enable = mkEnableOption "Enable Matrix.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      element-desktop
    ];
  };
}
