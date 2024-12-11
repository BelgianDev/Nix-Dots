{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.bitwarden;
in {
  options.module.app.bitwarden = {
    enable = mkEnableOption "Enable bitwarden.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
