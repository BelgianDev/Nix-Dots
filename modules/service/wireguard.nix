{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.service.wireguard;
in {
  options.module.service.wireguard = {
    enable = mkEnableOption "Enables wireguard";

     localAddress = mkOption {
      type = types.str;
      description = "IP of this machine on the VPN network (e.g., 10.100.0.2/24)";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wireguard-tools
    ];

    services.mullvad-vpn.enable = true;
    networking.wireguard = {
      useNetworkd = true;

      interfaces.wg0 = {
        ips = [ cfg.localAddress ];

        privateKeyFile =  config.sops.secrets.wireguard.path;

        peers = [ 
          {
            publicKey = "DP8MXft57B4QtA6H3A06aGEHBnCIPV6dRiBqX986OUY=";
            allowedIPs = [ "192.168.0.0/16" "10.10.2.0/24" ];
            endpoint = "vpn.raftdev.com:51821";
            persistentKeepalive = 25;
          } 
        ];
      };
    };
  };
}
