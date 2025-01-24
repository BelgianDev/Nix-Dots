{ config, lib, pkgs, ... }:

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
      package = pkgs.wireshark;
    };

    environment.systemPackages = with pkgs; [
      postman
      ghex

      # Wireshark
      tshark
      termshark

      ripgrep # recursively searches web directories for a regex pattern
      nmap
      whois
    ];
  };
}
