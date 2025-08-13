{ config, lib, ... }:

with lib;

let
  cfg = config.module.hardware.ssd;
in {
  options.module.hardware.ssd = {
    enable = mkEnableOption "Enable SSD tools.";
  };

  config = mkIf cfg.enable {
    services.fstrim.enable = true;
  };
}
