{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.browser.firefox;
in {
  options.module.app.browser.firefox = {
    enable = mkEnableOption "Enable Firefox Browser.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
