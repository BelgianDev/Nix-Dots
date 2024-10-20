{ lib, ... }: 

{
  imports = [
    ./app/terminal/alacritty.nix
    ./cli/btop.nix
    ./desktop/gnome.nix
    ./shell/fish.nix
  ];

  # Apps
  home.app.terminal.alacritty.enable = lib.mkDefault true; # Alacritty

  # Apps - Cli
  home.cli.btop.enable = lib.mkDefault true; # Btop

  # Desktops
  home.desktop.gnome = { # Gnome
    enable = lib.mkDefault true; # Default DE;
  };

  # Shells
  home.shell.fish.enable = lib.mkDefault true; # Fish
}
