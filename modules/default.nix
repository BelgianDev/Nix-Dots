{ lib, pkgs-unstable, ... }: 

{
  imports = [
    ./cli.nix
    ./secrets.nix
    ./system-theme.nix

    ./app/neovim.nix
    ./app/browser/zen.nix
    ./app/dev/java.nix
    ./app/gaming/steam.nix
    ./app/gaming/minecraft.nix
    ./app/sftp/filezilla.nix
    ./app/virtualization/boxes.nix

    ./desktop/gnome.nix
    ./kernel/kernel.nix
    ./kernel/nvidia.nix
    ./service/bluetooth.nix
  ];

  # Apps
  module.app.neovim.enable = false;
  module.app.browser.zen.enable = lib.mkDefault true;
  module.app.dev.java.enable = lib.mkDefault true;
  module.app.gaming.steam.enable = lib.mkDefault false;
  module.app.gaming.minecraft.enable = lib.mkDefault true;
  module.app.sftp.filezilla.enable = lib.mkDefault true;
  module.app.virtualisation.boxes.enable = lib.mkDefault false;

  # Desktops
  module.desktop.gnome = {
    enable = lib.mkDefault true;
    wayland = lib.mkDefault true;
    gdm.enable = lib.mkDefault true;
  };

  # Kernel Stuff
  module.kernel.unstable = lib.mkDefault false; # Shit may break.
  module.kernel.nvidia = {
    enable = lib.mkDefault false;
    open = lib.mkDefault false;
    settings = lib.mkDefault true;
  };

  # Services
  module.service.bluetooth.enable = lib.mkDefault true;
}