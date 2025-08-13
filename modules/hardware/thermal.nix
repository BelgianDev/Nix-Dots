{ config, lib, ... }:

with lib;

let
  cfg = config.module.hardware.thermal;
in {
  options.module.hardware.thermal = {
    enable = mkEnableOption "Enable overheating tools.";
  };

  config = mkIf cfg.enable {
    services.thermald.enable = true;
  };
}
