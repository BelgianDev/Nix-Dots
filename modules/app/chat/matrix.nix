{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.chat.matrix;
in {
  options.module.app.chat.matix = {
    enable = mkEnableOption "Enable Matrix.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cinny-desktop
    ];
  };
}
