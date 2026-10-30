{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.cli.rbw;
in {
  options.home.cli.rbw = {
    enable = mkEnableOption "Enable Bitwarden CLI tool";
  };

  config = mkIf cfg.enable {
    programs.rbw = {
      enable = true;
      
      settings = {
        base_url = "https://api.bitwarden.eu";
        identity_url = "https://identity.bitwarden.eu";
        
        email = "theraft08@gmail.com";
        pinentry = pkgs.pinentry-gnome3;
      };
    };
  };
}
