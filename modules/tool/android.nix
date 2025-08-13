{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.tool.android;
in {
  options.module.tool.android = {
    enable = mkEnableOption "Enabled Android tools";
  };

  config = mkIf cfg.enable {
    programs.adb.enable = true;
    environment.systemPackages = with pkgs; [
      scrcpy
    ];
  };
}
