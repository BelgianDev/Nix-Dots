{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.music.feishin;
in {
  options.module.app.music.feishin = {
    enable = mkEnableOption "Enable feishin.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      feishin
      jellyfin-tui
    ];
  };
}
