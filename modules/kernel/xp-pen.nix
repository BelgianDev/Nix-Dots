i{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.kernel.xp-pen;
in {
  options.module.kernel.xp-pen = {
    enable = mkEnableOption "Enables Controller XP-Pen drivers";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      linuxKernel.packages.
    ]
  };
}
