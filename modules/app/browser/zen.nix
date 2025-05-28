{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.module.app.browser.zen;
in {
  options.module.app.browser.zen = {
    enable = mkEnableOption "Enable Zen Browser.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.zen.packages."${system}".beta
    ];
  };
}
