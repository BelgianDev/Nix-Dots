{ config, lib, ... }:

with lib;

let
  cfg = config.module.hardware.fingerprint;
in {
  options.module.hardware.fingerprint = {
    enable = mkEnableOption "Enable fingerprint sensors.";
  };

  config = mkIf cfg.enable {
    services.fprintd = {
      enable = true;
    };

    security.pam.services = {
      sudo.fprintAuth = true;
      polkit-1.fprintAuth = true;

      gdm-fingerprint.fprintAuth = true;
    };
  };
}
