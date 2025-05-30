{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.dev.python;
in {
  options.module.app.dev.python = {
    enable = mkEnableOption "Enable python Developpement Tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.jetbrains.pycharm-professional
      python3Full
    ];
  };
}
