{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.dev.web;
in {
  options.module.app.dev.web = {
    enable = mkEnableOption "Enable Web Developpement Tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs-unstable; [
      jetbrains.webstorm
    ];
  };
}
