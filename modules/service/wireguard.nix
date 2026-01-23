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
      type = types.path;
      description = "Path to the private key for this device";
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

    networking.wireguard.interfaces.wg0 = {
      ips = [ cfg.localAddress ];
      listenPort = 51820;

      privateKeyFile = cfg.privateKeyFile;

      peers = [ 
        {
          publicKey = "E/nBY7wBEgo9kM+IwSPdCOpqfYsqgE/sOc0fYc4x2Dw=";
          allowedIPs = [ "10.100.0.1/32" "192.168.0.0/24" ];
          endpoint = "ssh.atlasworld.fr:51820";
          persistentKeepalive = 25;
        } 
      ];
    };
  };
}
