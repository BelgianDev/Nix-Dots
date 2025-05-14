{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.obsidian;
in {
  options.module.app.obsidian = {
    enable = mkEnableOption "Enable obisidian.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
