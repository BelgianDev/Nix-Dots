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
    };
  };

  environment.sessionVariables = rec {
    AW_REPO_USERNAME = "$(< ${config.sops.secrets.aw_username.path})";
    AW_REPO_PASSWORD = "$(< ${config.sops.secrets.aw_password.path})";
  };
}