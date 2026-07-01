{ config, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;

    age = {
      keyFile = "/home/raftdev/.config/sops/age/keys.txt";     
    };

    secrets = {
      aw_username = {
        owner = "raftdev";
      };
      aw_password = {
        owner = "raftdev";
      };

      wireguard_laptop = {
        key = "wireguard_laptop";
        owner = "root";
      };
    };
  };

  environment.sessionVariables = {
    REPO_USERNAME = "$(< ${config.sops.secrets.aw_username.path})";
    REPO_PASSWORD = "$(< ${config.sops.secrets.aw_password.path})";
  };
}