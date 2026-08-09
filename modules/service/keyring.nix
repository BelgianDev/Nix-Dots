{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.keyring;
in {
  options.module.service.keyring = {
    enable = mkEnableOption "Enables enhanced keyring";
  };

  config = mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    environment.systemPackages = with pkgs; [
      seahorse
      gcr
    ];
  };
}
