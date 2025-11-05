{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.winboat;
in {
  options.module.app.winboat = {
    enable = mkEnableOption "Enable winboat";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.winboat
      unstable.freerdp
    ];
  };
}
