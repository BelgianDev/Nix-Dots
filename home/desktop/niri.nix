{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.desktop.niri;
in {
  options.home.desktop.niri = {
    enable = mkEnableOption "Enables custom Niri Shell configuration.";
  };

  config = mkIf cfg.enable {
    programs.niri = {
      config = ''
        spawn-at-startup "vicinae" "server"

        input {
          focus-follows-mouse

          keyboard {
            xkb {
              layout "be"
              model "pc104"
              options "terminate:ctrl_alt_bksp"
            }
          }
        }

        binds {

          // System Level
          Mod+Shift+L { quit; }
          Mod+Q { close-window; }
          Mod+Return repeat=false { spawn "vicinae" "toggle"; }          

          // Movement
          Mod+Right { focus-column-right; }
          Mod+Left { focus-column-left; }
          Mod+Down { focus-window-or-workspace-down; }
          Mod+Up { focus-window-or-workspace-up; }

          Mod+Ctrl+Right { focus-monitor-right; }
          Mod+Ctrl+Left { focus-monitor-left; }
          Mod+Ctrl+Down { focus-monitor-down; }
          Mod+Ctrl+Up { focus-monitor-up; }

          // Apps
          Mod+R repeat=false { spawn "alacritty"; }
          Mod+W repeat=false { spawn "zen-beta"; }
        }

        output "DP-3" {
          scale 1
          focus-at-startup
          position x=0 y=0
        }
      
        output "HDMI-A-1" {
          scale 1
          position x=1920 y=0
        }
      '';
    };
  };
}
