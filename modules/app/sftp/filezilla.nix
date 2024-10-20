{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.sftp.filezilla;
in {
  options.module.app.sftp.filezilla = {
    enable = mkEnableOption "Enables FileZilla SFTP-Client";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      filezilla
    ];
  };
}
