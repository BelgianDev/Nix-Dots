{ lib, pkgs-unstable, ... }: 

{
  imports = [
    ./app/editor.nix
    ./app/spotify.nix
    ./app/terminal/alacritty.nix
    ./cli/btop.nix
    ./desktop/gnome.nix
    ./shell/fish.nix
  ];

  # Apps
  home.app.spotify.enable = lib.mkDefault true; # Spotify
  home.app.terminal.alacritty.enable = lib.mkDefault true; # Alacritty



  # Cli
  home.cli.btop.enable = lib.mkDefault true; # Btop

  # DesktopS
  home.desktop.gnome.enable = lib.mkDefault true; # Default DE

  # Shells
  home.shell.fish.enable = lib.mkDefault true; # Fish
}
