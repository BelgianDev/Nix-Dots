{ config, lib, ... }:

with lib;

let
  cfg = config.home.bar.waybar;
in {
  options.home.bar.waybar = {
    enable = mkEnableOption "Enable waybar";
  };
  
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = [
        {
          layer = "top";
          position = "top";
          
          # Styling
          margin-top = 4;
          margin-right = 4;
          margin-left = 4;

          spacing = 15;
          height = 40;

          # Modules Setup
          modules-left = ["hyprland/workspaces" "clock#time" "clock#date"];
          modules-center = ["hyprland/window"];
          modules-right = ["tray" "temperature#gpu" "temperature#cpu" "cpu" "memory" "wireplumber"];

          # Modules
          "clock#time" = {
            format = "<span color=\"#7aa2f7\"> </span>{:%H:%M:%S}";
            interval = 1;
          };

          "clock#date" = {
            format = "<span color=\"#7aa2f7\"> </span>{:%a %d/%m}";
            tooltip-format = "<tt>{calendar}</tt>";
            interval = 360;
            calendar = {
              mode = "month";
              mode-mon-col = 4;
              weeks-pos = "right";
              on-scroll = 1;
              on-click-right = "mode";
              format = {
                months = "<span color='#c0caf5'><b>{}</b></span>";
                days = "<span color='#c0caf5'><b>{}</b></span>";
                weeks = "<span color='#7dcfff'><b>W{}</b></span>";
                weekdays = "<span color='#ff9e64'><b>{}</b></span>";
                today = "<span color='#f7768e'><b><u>{}</u></b></span>";
              };
            };
          };

          "battery" = {
            bat = "BAT0";
            interval = 60;
            states = {
              warning = 40;
              critical = 20;
            };
            format = "{icon} {capacity}%";
            format-icons = [
              "<span color=\"#f7768e\"> </span>"
              "<span color=\"#f7768e\"> </span>"
              "<span color=\"#7aa2f7\"> </span>"
              "<span color=\"#7aa2f7\"> </span>"
              "<span color=\"#7aa2f7\"> </span>"
            ];
            format-charging = "<span color=\"#e0af68\">󱐌</span> {capacity}%";
          };

          "cpu" = {
            format = "<span color=\"#7aa2f7\"> </span>{usage}%";
            interval = 2;
          };

          "memory" = {
            format = "<span color=\"#7aa2f7\"> </span>{used}GiB";
            interval = 2;
          };

          "temperature#cpu" = {
            hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            format = "<span color=\"#7aa2f7\"> </span>{temperatureC}°C";
            format-critical = "<span color=\"#f7768e\"> </span>{temperatureC}°C";
            interval = 2;
          };

          "temperature#gpu" = {
            hwmon-path = "/tmp/nvidia-temp";
            critical-threshold = 80;
            format = "<span color=\"#7aa2f7\">󰾲 </span>{temperatureC}°C";
            format-critical = "<span color=\"#f7768e\">󰾲 </span>{temperatureC}°C";
            interval = 2;
          };

          "wireplumber" = {
            scroll-step = 5;
            format = "<span color=\"#7aa2f7\">{icon} </span>{volume}%";
            format-muted = "<span color=\"#f7768e\"> </span>Muted";
            format-icons = [ "" "" "" ];
            on-click = "pavucontrol-qt";
          };

          "hyprland/window" = {
            max-length = 96;
          };

          "tray" = {
            icon-size = 20;
            spacing = 6;
          };

          "hyprland/workspaces" = {
            disable-scroll = true;
            on-click = "activate";
          };
        }
      ];

      style = ''
        * {
          font-family: JetbrainsMono Nerd Font, monospace;
          font-weight: bold;
          font-size: 14px;
          color: #C0CAF5;
        }

        window#waybar{
          background: rgba(21, 22, 30, 0.5);
        }

        tooltip {
          background: #1e1e2e;
        }

        #workspaces button {
          padding: 0px;
          color: #c0caf5;
        }

        #workspaces button.active {
          border-bottom: 2px solid #7aa2f7;
          border-radius: 0px;
          margin-bottom: 2px;
        }

        #workspaces button.focused {
          color: #a6adc8;
        }

        #workspaces button.urgent {
          color: #F7768E;
        }

        #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
        }

        #custom-kernel,
        #custom-pacman,
        #clock,
        #window,
        #temperature,
        #cpu,
        #memory,
        #pulseaudio,
        #tray {
          background: rgba(21, 22, 30, 0.7);
          padding: 0px 10px;
          margin: 3px 0px;
          border: 0px;
        }

        #workspaces {
          background: rgba(21, 22, 30, 0.7);
          padding: 0px 10px;
          margin: 3px 0px;
          border: 0px;
        }

        #tray {
          border-radius: 12px 12px 12px 12px;
          margin-right: 4px;
        }

        #window {
          border-radius: 12px 12px 12px 12px;
        }

        #temperature {
          border-radius: 12px 0px 0px 12px;
        }

        #custom-pacman, #custom-kernel {
          border-radius: 0px 12px 12px 0px;
        }
      '';
    };

    # Include waybar in hyprland config.
    wayland.windowManager.hyprland.settings.exec-once = [
      "waybar"
    ];
  };
}