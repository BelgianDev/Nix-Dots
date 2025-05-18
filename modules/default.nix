{ lib, pkgs, inputs, ... }: 

{
  imports = [
    ./cli.nix
    ./fonts.nix
    ./secrets.nix
    ./network.nix
    ./system-theme.nix

    ./app/aseprite.nix
    ./app/bitwarden.nix
    ./app/teams.nix
    ./app/mqtt.nix
    ./app/dev/analysis.nix
    ./app/dev/java.nix
    ./app/dev/python.nix
    ./app/dev/rust.nix
    ./app/dev/docker.nix
    ./app/dev/c.nix
    ./app/dev/web.nix
    ./app/browser/zen.nix
    ./app/gaming/steam.nix
    ./app/gaming/minecraft.nix
    ./app/sftp/filezilla.nix
    ./app/virtualization/boxes.nix

    ./container/excalidraw.nix

    ./kernel/controller.nix
    ./kernel/kernel.nix
    ./kernel/nvidia.nix
    ./kernel/graphics.nix

    ./desktop/gdm.nix
    ./desktop/gnome.nix
    ./desktop/hyprland


    ./service/bluetooth.nix
  ];

  # Default

  # Apps
  module.app.bitwarden.enable = lib.mkDefault true;
  module.app.teams.enable = lib.mkDefault true;
  module.app.dev.java.enable = lib.mkDefault true;
  module.app.dev.rust.enable = lib.mkDefault false;
  module.app.dev.python.enable = lib.mkDefault false;
  module.app.dev.c.enable = lib.mkDefault false;
  module.app.dev.analysis.enable = lib.mkDefault true;
  module.app.dev.docker.enable = lib.mkDefault true;
  module.app.browser.zen.enable = lib.mkDefault true;
  module.app.gaming.steam.enable = lib.mkDefault false;
  module.app.gaming.minecraft.enable = lib.mkDefault true;
  module.app.sftp.filezilla.enable = lib.mkDefault true;
  module.app.virtualisation.boxes.enable = lib.mkDefault false;

  module.fonts.enable = lib.mkDefault true;

  # Containers
  module.container = {
    excalidraw.enable = lib.mkDefault false;
  };

  # Desktops
  module.desktop.gnome.enable = lib.mkDefault true;
  module.desktop.gdm.enable = lib.mkDefault true;

  # Kernel Stuff
  module.kernel.unstable = lib.mkDefault false; # Shit may break.
  module.kernel.controller.enable = lib.mkDefault true;
  module.kernel.nvidia = {
    enable = lib.mkDefault false;
    open = lib.mkDefault false;
    settings = lib.mkDefault true;
  };

  # Services
  module.service.bluetooth.enable = lib.mkDefault true;
  
  # Needed Apps
  environment.systemPackages = with pkgs; [
    libnotify
  ];

  # Other
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" "nixpkgs-unstable=${inputs.nixpkgs-unstable}" ];
  boot.tmp.cleanOnBoot = true; # Makes system clean de temporary directory at each reboot.

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libpulseaudio
    glfw
    openal
    stdenv.cc.cc.lib
    flite
    libxkbcommon
    wayland

    libGL
    libGL.dev

    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libXxf86vm
  ];
}
