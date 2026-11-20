{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.cad.kicad;
in {
  options.module.app.cad.kicad = {
    enable = mkEnableOption "Enable Kicad.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kicad
    ];
  };
}
