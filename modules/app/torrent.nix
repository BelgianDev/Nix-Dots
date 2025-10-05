{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.torrent;
in {
  options.module.app.torrent = {
    enable = mkEnableOption "Enable Torrenting app.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qbittorrent
    ];
  };
}
