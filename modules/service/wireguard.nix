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

    # Path to the private key file
    privateKeyFile = mkOption {
      type = types.str;
      description = "Private key file for this device";
    };
  };

  config = mkIf cfg.enable {
    networking.firewall = {
      allowedUDPPorts = [ 51820 ];
      checkReversePath = "loose";
    };

    environment.systemPackages = with pkgs; [
      wireguard-tools
    ];

    services.mullvad-vpn.enable = true;
    networking.wireguard = {
      useNetworkd = true;

      interfaces.wg0 = {
        ips = [ cfg.localAddress ];
        listenPort = 51820;

        privateKeyFile = cfg.privateKeyFile;

        peers = [ 
          {
            publicKey = "BCHyC+9csZO7h6629qKH8BxrO9kG/gGdt2kb0aztklI=";
            allowedIPs = [ "10.10.10.1/32" "192.168.0.0/16" ];
            endpoint = "vpn.atlasworld.fr:51820";
            persistentKeepalive = 22;
          } 
        ];
      };
    };
  };
}
