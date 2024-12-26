{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.module.app.gaming.suyu;
in {
  options.module.app.gaming.suyu = {
    enable = mkEnableOption "Enables Suyu Switch Emulator.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
        inputs.suyu.packages.${pkgs.system}.suyu
    ];
  };
}
