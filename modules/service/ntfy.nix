{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.ntfy;
in {
  options.module.service.ntfy = {
    enable = mkEnableOption "Enables ntfy client";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ 
      ntfy-sh
      libnotify
      bash
    ];

    systemd.services."ntfy-daemon" = {
      description = "ntfy notification client";
      wantedBy = [ "default.target" ];
      after = [ "network.target" ];

      serviceConfig = { 
        ExecStart = ''
          ${pkgs.ntfy-sh}/bin/ntfy sub https://ntfy.atlasworld.fr/testing '${pkgs.libnotify}/bin/notify-send "$NTFY_TITLE" "$NTFY_MESSAGE"'
        '';  
        RestartSec = 5; 
        Restart = "always";
        Environment = "PATH=/run/current-system/sw/bin:/usr/bin:/bin";
      };
    };
  };
}
