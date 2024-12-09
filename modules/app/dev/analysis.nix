{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.dev.analysis;
in {
  options.module.app.dev.analysis = {
    enable = mkEnableOption "Enable analysis tools";
  };

  config = mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs-unstable.wireshark;
    };

    environment.systemPackages = with pkgs-unstable; [
      postman

      # Wireshark
      tshark
      termshark

      ripgrep # recursively searches web directories for a regex pattern
      nmap
      whois
    ];
  };
}
