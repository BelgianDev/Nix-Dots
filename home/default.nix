{ lib, ... }: 

{
  imports = [
    ./app/editor/vscode.nix
    ./app/spotify.nix
    ./app/terminal/alacritty.nix
    ./app/chat/discord.nix

    ./cli/bat.nix
    ./cli/btop.nix
    ./cli/cava.nix

    ./desktop/gnome.nix
    
    ./shell/fish.nix
  ];

  home = {
    desktop.gnome.enable = lib.mkDefault true;
    shell.fish.enable = lib.mkDefault true;

    cli = {
      btop.enable = lib.mkDefault true;
      cava.enable = lib.mkDefault true;
      bat.enable = lib.mkDefault true;
    };

    app = {
      spotify.enable = true;

      editor.vscode.enable = lib.mkDefault true;
      terminal.alacritty.enable = lib.mkDefault true;

      chat = {
        discord.enable = lib.mkDefault true;
      };
    };
  };

  # Services
  services.mpris-proxy.enable = lib.mkDefault true;
}
