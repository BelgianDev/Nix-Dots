{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.home.app.yazi;
in {
  options.home.app.yazi = {
    enable = mkEnableOption "Enable Yazi file explorer.";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableFishIntegration = config.home.shell.fish.enable;
    };
  };
}
