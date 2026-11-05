{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.ssh-server;
in {
  options.module.service.ssh-server = {
    enable = mkEnableOption "Enables the SSH server";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
