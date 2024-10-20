{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.bluetooth;
in {
  options.module.service.bluetooth = {
    enable = mkEnableOption "Enables bluetooth support.";
  };

  config = mkIf cfg.enable {

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };

    systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = [ "network.target" "sound.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };

    environment.systemPackages = with pkgs; [
      playerctl
      bluetuith
    ];
  };
}
