{ config, lib, ... }:

with lib;

let
  cfg = config.module.kernel.controller;
in {
  options.module.kernel.controller = {
    enable = mkEnableOption "Enables Controller Drivers";
  };

  config = mkIf cfg.enable {
    hardware.xpadneo.enable = true;
    hardware.xone.enable = true;

    hardware.bluetooth.settings = {
      General = {
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
        FastConnectable = true;
      };
    };

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ xpadneo xone];
      extraModprobeConfig = ''
        options bluetooth disable_ertm=Y
      '';
    };
  };
}
