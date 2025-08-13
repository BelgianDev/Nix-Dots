{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.gaming.switch;
in {
  options.module.app.gaming.switch = {
    enable = mkEnableOption "Enable the Nintendo Switch Emulator.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.unstable; [
      ryubing
    ];
  };
}
