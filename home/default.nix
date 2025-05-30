{ lib, ... }: 

{
  imports = [
    ./app/editor/vscode.nix
    ./app/spotify.nix
    ./app/terminal/alacritty.nix

    ./bar/waybar.nix

    ./cli/btop.nix
    ./cli/cava.nix

    ./desktop/hyprland.nix
    ./desktop/gnome.nix
    
    ./shell/fish.nix
  ];

  # Apps
  home.app.editor.vscode.enable = lib.mkDefault true;

  home.app.spotify.enable = lib.mkDefault true;
  home.app.terminal.alacritty.enable = lib.mkDefault true; 

  # Cli
  home.cli.btop.enable = lib.mkDefault true;
  home.cli.cava.enable = lib.mkDefault true;

  # Desktop
  home.desktop.gnome.enable = lib.mkDefault true;
  home.desktop.hyprland.enable = lib.mkDefault true; # Main Desktop

  # Shells
  home.shell.fish.enable = lib.mkDefault true; # Fish

  # Services
  # services.mpris-proxy.enable = lib.mkDefault true; - BROKEN: https://github.com/nix-community/home-manager/issues/7164
}
