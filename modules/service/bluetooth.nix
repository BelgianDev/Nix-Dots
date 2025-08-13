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

    environment.systemPackages = with pkgs; [
      playerctl
      bluetuith
    ];
  };
}
