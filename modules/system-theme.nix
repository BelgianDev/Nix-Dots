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

  stylix.image = ./../assets/wallpaper/space-suit.png;
  stylix.polarity = "dark";

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.5;
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
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrains Mono Nerd Font";
    };
  };
}