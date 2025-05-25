{ config, lib, ... }:

with lib;

let
  cfg = config.module.app.browser.firefox;
in {
  options.module.app.browser.firefox = {
    enable = mkEnableOption "Enable FireFox Browser.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
