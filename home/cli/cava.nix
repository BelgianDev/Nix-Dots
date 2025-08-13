{ config, lib, ... }:

with lib;

let
  cfg = config.home.cli.cava;
in {
  options.home.cli.cava = {
    enable = mkEnableOption "Enable Cava Configuration.";
  };

  config = mkIf cfg.enable {
    programs.cava = {
      enable = true;
      
      settings = {
        output.show_idle_bar_heads = 0;

        general = {
          framerate = 60;
          overshoot = 0;
        };
      };
    };
  };
}
