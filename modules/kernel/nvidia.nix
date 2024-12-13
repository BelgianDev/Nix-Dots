{ config, lib, ... }:

with lib;

let
  cfg = config.module.kernel.nvidia;
in {
  options.module.kernel.nvidia = {
    enable = mkEnableOption "Enables the Nvidia";
    open = mkEnableOption "Enables the Nvidia Open-Source (Nouveau Drivers)";
    settings = mkEnableOption "Enables Nvidia Settings Program";
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      
      open = cfg.open;

      nvidiaSettings = cfg.settings;
      package = mkDefault config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
