{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.dns;
in {
  options.module.service.dns = {
    enable = mkEnableOption "Enables custom DNS.";
  };

  config = mkIf cfg.enable {

    networking = {
      networkmanager.dns = "none";
      dhcpcd.extraConfig = ''
        nohook resolv.conf
      '';
      nameservers = [
        "192.168.0.135"
        "1.1.1.1"
      ];
    };
    
    services.resolved.enable = false;
  };
}
