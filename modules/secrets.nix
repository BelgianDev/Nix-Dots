{ config, lib, ... }:

with lib;

let
  cfg = config.module.secrets;
in {
  options.module.secrets = {
    wireguard = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "Wireguard key path";
    };

    ssh-key = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "Device SSH-key";
    };
  };

  config.sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/home/raftdev/.config/sops/age/keys.txt";     

    secrets = {
      # RClone

      "rclone/media/user" = {
        key = "rclone/media/user";
        owner = "raftdev";
      };
      "rclone/media/password" = {
        key = "rclone/media/password";
        owner = "raftdev";
      };
      "rclone/media/host" = {
        key = "rclone/media/host";
        owner = "raftdev";
      };

      "rclone/cloud/user" = {
        key = "rclone/cloud/user";
        owner = "raftdev";
      };
      "rclone/cloud/password" = {
        key = "rclone/cloud/password";
        owner = "raftdev";
      };
      "rclone/cloud/host" = {
        key = "rclone/cloud/host";
        owner = "raftdev";
      };

      # Wireguard

      wireguard = mkIf (cfg.wireguard != null) {
        key = "wireguard/${cfg.wireguard}";
        owner = "root";
        group = "root";
        mode = "0600";
      };

      # SSH

      ssh-key = mkIf (cfg.ssh-key != null) {
        key = "ssh/${cfg.ssh-key}";
        owner = "raftdev";
        mode = "0600";
        path = "/home/raftdev/.ssh/id_ed25519";
      };
    };
  };
}
