{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.mqtt;
in {
  options.module.app.mqtt = {
    enable = mkEnableOption "Enable mqtt";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mqtt-explorer
    ];

    services.mosquitto = {
      enable = true;
      listeners = [
        {
          acl = [ "pattern readwrite #" ];
          omitPasswordAuth = true;
          port = 1883;
          settings = {
            allow_anonymous = true;
          };
        }
        {
          acl = [ "pattern readwrite #" ];
          omitPasswordAuth = true;
          port = 9001;
          settings = {
            protocol = "websockets";
            allow_anonymous = true;
          };
       }  
      ];
    };
  };
}