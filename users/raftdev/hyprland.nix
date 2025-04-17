{ ... }:

{
  wayland.windowManager.hyprland = { 
    enable = true;
    settings = {
      input = {
        kb_layout = "be";

        touchpad = {
          natural_scroll = true;
        };
      };

      monitor = [
        "DP-1, preferred, 0x0, 1"
        "HDMI-A-1, preferred, 1920x0, 1"
      ];


      # Keybinds
      "$main" = "SUPER";

      bind = [
        # Shortcuts
        "Super, RETURN, exec, pkill rofi || rofi -show drun"
        "Super, Q, killactive"

        # Shortcuts - Navigation
        "Super, left, movefocus, l"
        "Super, right, movefocus, r"
        "Super, up, movefocus, u"
        "Super, down, movefocus, d"

        "Super Ctrl, left, workspace, -1"
        "Super Ctrl, right, workspace, +1"

        "Super + Alt, Left, splitratio, -0.1"
        "Super + Alt, Right, splitratio, +0.1"
        "Super + Alt, Up, splitratio, -0.1"
        "Super + Alt, Down, splitratio, +0.1"

        # Programs
        "Super, R, exec, alacritty"
        "Super, W, exec, zen"
      ];

      # Styling
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        # "col.active_border" = "rgb(00B4D8) rgba(90E0EFEE) 45deg";
        # "col.inactive_border" = "rgba(0077B6aa)";

        resize_on_border = false; 
        allow_tearing = false;
        layout = "dwindle";
      };


      decoration = {
        rounding = 10;

        active_opacity = 1;
        inactive_opacity = 1;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };


        blur = {
          enabled = true;

          size = 2;
          passes = 2;
          vibrancy = 1;

          new_optimizations = true;
        };
      };

      # Misc
      misc = { 
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}