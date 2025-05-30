{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.kernel.intel;
in {
  options.module.kernel.intel = {
    enable = mkEnableOption "Enables the Intel Drivers";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver intel-media-driver ];
      extraPackages = with pkgs; [ 
        intel-media-driver
        intel-vaapi-driver
      ];
    };
  };
}
