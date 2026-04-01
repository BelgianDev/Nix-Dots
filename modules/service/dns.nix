{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.dns;
in {
  options.module.service.bdns = {
    enable = mkEnableOption "Enables custom DNS.";
  };

  config = mkIf cfg.enable {
    networking.nameservers = [
      "192.168.0.135"
      "1.1.1.1"
    ];
  };
}
