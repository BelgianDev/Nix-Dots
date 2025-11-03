{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.app.terminal.alacritty;
in {
  options.home.app.terminal.alacritty = {
    enable = mkEnableOption "Enable Alacritty's Configuration.";
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        general.live_config_reload = true;
        
        terminal.shell = {
          program = "fish";
        };

        window = {
          decorations = "none";
          class = {
            instance = "Alacritty";
            general = "Alacritty";
          };
          
          padding = {
            x = 15;
            y = 15;
          };
        };
      };
    };
  };
}
