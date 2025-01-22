{ config, lib, ... }:

with lib;

let
  cfg = config.module.app.dev.docker;
in {
  options.module.app.dev.docker = {
    enable = mkEnableOption "Enable docker";
  };

  config = mkIf cfg.enable {
    virtualisation.docker = { 
      enable = true;
      daemon.settings = { 
        userland-proxy = false;
        iptables = true;
      };
    };

    virtualisation.oci-containers.backend = "docker";
  };
}
