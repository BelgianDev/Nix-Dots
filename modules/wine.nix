{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.wine;
in {
  options.module.wine = {
    enable = mkEnableOption "Wine translation layer";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wine
      wine64
    ];
  };
}