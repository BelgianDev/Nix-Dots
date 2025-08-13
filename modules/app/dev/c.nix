{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.dev.c;
in {
  options.module.app.dev.c = {
    enable = mkEnableOption "Enable C & CPP developpement tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.jetbrains.clion
      platformio-core
    ];

    services.udev.packages = with pkgs; [ platformio-core.udev];
  };
}
