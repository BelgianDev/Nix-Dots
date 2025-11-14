{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.hardware.printers;
in {
  options.module.hardware.printers = {
    enable = mkEnableOption "Enable printers support";
  };

  config = mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };

  };
}
