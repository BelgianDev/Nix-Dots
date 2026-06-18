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
        spawn-at-startup "awww-daemon"

        prefer-no-csd

        input {
          focus-follows-mouse

          keyboard {
            xkb {
              layout "be"
              model "pc104"
              options "terminate:ctrl_alt_bksp"
            }
          }

          touchpad {
            natural-scroll
          }
        }

        hotkey-overlay {
          skip-at-startup
        }

        binds {

          // System Level
          Mod+Shift+L { quit; }
          Mod+Q { close-window; }
          Mod+Tab repeat=false { toggle-overview; }
          Mod+Return repeat=false { spawn "vicinae" "toggle"; }          

          // F- keys
          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

          XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioPause       allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
          XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
          XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

          XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

          // Movement
          Mod+Right { focus-column-right; }
          Mod+Left { focus-column-left; }
          Mod+Down { focus-window-or-workspace-down; }
          Mod+Up { focus-window-or-workspace-up; }

          Mod+Ctrl+Right { focus-monitor-right; }
          Mod+Ctrl+Left { focus-monitor-left; }
          Mod+Ctrl+Down { focus-monitor-down; }
          Mod+Ctrl+Up { focus-monitor-up; }

          // Window Management
          Mod+F { maximize-column; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }

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

        layout {
          gaps 10

          border {
            off
          }

          focus-ring {
            width 4
          
            active-gradient from="#ca9ee6" to="#eebebe" angle=45
          }

          shadow {
            on
            softness 30
            spread 5
            offset x=2 y=2 
          }
        }

        // Global Windows - Applies to all of them
        window-rule {
          draw-border-with-background false
        }

        window-rule {
          match app-id="^Alacritty$"

          background-effect {
            blur true
          }
        }
      '';
    };
  };
}
