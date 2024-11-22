{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.dev.analysis;
in {
  options.module.app.dev.analysis = {
    enable = mkEnableOption "Enable analysis tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs-unstable; [
      postman

      # Wireshark
      wireshark
      tshark
      termshark

      ripgrep # recursively searches directories for a regex pattern
      nmap
      whois
    ];
  };
}
