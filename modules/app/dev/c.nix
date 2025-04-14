{ config, lib, pkgs, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.dev.c;
in {
  options.module.app.dev.c = {
    enable = mkEnableOption "Enable C & CPP developpement tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pkgs-unstable.jetbrains.clion

      gcc
      meson

      cmake
      ninja
      dfu-util

      arduino-ide
    ];
  };
}
