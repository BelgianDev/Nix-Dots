{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.wine;
in {
  options.module.app.wine = {
    enable = mkEnableOption "Enable Wine Compatibilty layer.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wine
      bottles
    ];
  };
}
