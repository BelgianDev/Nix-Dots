{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.vlc;
in {
  options.module.app.vlc = {
    enable = mkEnableOption "Enable VLC video player.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vlc
      # unstable.makemkv # as of 26.05 stable is broken
      # mkvtoolnix
    ];
  };
}
