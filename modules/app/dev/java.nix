{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.dev.java;
in {
  options.module.app.dev.java = {
    enable = mkEnableOption "Enable Java Developpement Tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs-unstable; [
      jetbrains.idea-ultimate
      visualvm
    ];
  };
}
