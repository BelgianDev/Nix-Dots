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
    ./app/obisidian.nix
    ./app/teams.nix
    ./app/mqtt.nix
    ./app/dev/analysis.nix
    ./app/dev/java.nix
    ./app/dev/python.nix
    ./app/dev/rust.nix
    ./app/dev/docker.nix
    ./app/dev/c.nix
    ./app/dev/web.nix
    ./app/browser/firefox.nix
    ./app/browser/zen.nix
    ./app/gaming/steam.nix
    ./app/gaming/minecraft.nix
    ./app/gaming/suyu.nix
    ./app/sftp/filezilla.nix
    ./app/virtualization/boxes.nix

    ./container/excalidraw.nix

    ./kernel/controller.nix
    ./kernel/kernel.nix
    ./kernel/nvidia.nix
    ./kernel/graphics.nix

    ./desktop/gnome.nix
    ./service/bluetooth.nix
  ];

  # Apps
  module.app.bitwarden.enable = lib.mkDefault true;
  module.app.teams.enable = lib.mkDefault true;
  module.app.obsidian.enable = lib.mkDefault true;
  module.app.dev.java.enable = lib.mkDefault true;
  module.app.dev.rust.enable = lib.mkDefault false;
  module.app.dev.python.enable = lib.mkDefault false;
  module.app.dev.c.enable = lib.mkDefault false;
  module.app.dev.analysis.enable = lib.mkDefault true;
  module.app.dev.docker.enable = lib.mkDefault true;
  module.app.browser.zen.enable = lib.mkDefault true;
  module.app.browser.firefox.enable = lib.mkDefault true;
  module.app.gaming.steam.enable = lib.mkDefault false;
  module.app.gaming.minecraft.enable = lib.mkDefault true;
  module.app.gaming.suyu.enable = lib.mkDefault false;
  module.app.sftp.filezilla.enable = lib.mkDefault true;
  module.app.virtualisation.boxes.enable = lib.mkDefault false;

  # Containers
  module.container = {
    excalidraw.enable = lib.mkDefault false;
  };

  # Desktops
  module.fonts.enable = lib.mkDefault true;
  module.desktop.gnome = {
    enable = lib.mkDefault true;
    wayland = lib.mkDefault true;
    gdm.enable = lib.mkDefault true;
  };

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
