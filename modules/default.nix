{ lib, ... }: 

{
  imports = [
    ./system-theme.nix
    ./cli.nix

    ./app/browser/zen.nix
    ./app/sftp/filezilla.nix

    ./desktop/gnome.nix
    ./kernel/kernel.nix
    ./kernel/nvidia.nix
    ./service/bluetooth.nix
  ];

  # Apps
  module.app.browser.zen.enable = true;
  module.app.sftp.filezilla.enable = true;

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
