{ pkgs, ... }: 

{
  stylix.enable = true;
  stylix.autoEnable = true;

  # Home Manager Integration
  stylix.homeManagerIntegration = {
    autoImport = true;
    followSystem = true;
  };

  # Disables TTY theming.
  stylix.targets.console.enable = false;

  stylix.image = ./../assets/wallpaper/sky.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
  stylix.polarity = "dark";

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.8;
    desktop = 1.0;
    popups = 1.0;
  };

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 24;
  };

  stylix.fonts = {
    sizes = {
      applications = 10;
      terminal = 10;
      desktop = 10;
      popups = 10;
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };
  };
}