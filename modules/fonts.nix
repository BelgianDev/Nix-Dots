{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.fonts;
in {
  options.module.fonts= {
    enable = mkEnableOption "Adds missing fonts";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      vista-fonts
    ];
  };
}
