{ lib, pkgs, inputs, ... }: 

{
  imports = [
    ./cli.nix
    ./wine.nix
    ./fonts.nix
    ./localisation.nix
    ./secrets.nix
    ./network.nix
    ./system-theme.nix

    ./app/bitwarden.nix
    ./app/obsidian.nix
    ./app/vlc.nix
    ./app/dev/analysis.nix
    ./app/dev/java.nix
    ./app/dev/python.nix
    ./app/dev/rust.nix
    ./app/dev/docker.nix
    ./app/dev/c.nix
    ./app/dev/web.nix
    ./app/browser/firefox.nix
    ./app/browser/zen.nix
    ./app/chat/discord.nix
    ./app/chat/whatsapp.nix
    ./app/chat/teams.nix
    ./app/creation/aseprite.nix
    ./app/creation/blockbench.nix
    ./app/gaming/steam.nix
    ./app/gaming/minecraft.nix
    ./app/gaming/switch.nix
    ./app/sftp/filezilla.nix
    ./app/virtualization/boxes.nix

    ./hardware/firmware.nix
    ./hardware/ssd.nix
    ./hardware/thermal.nix

    ./kernel/controller.nix
    ./kernel/kernel.nix
    ./kernel/nvidia.nix
    ./kernel/intel.nix
    ./kernel/graphics.nix

    ./desktop/gdm.nix
    ./desktop/gnome.nix

    ./service/bluetooth.nix

    ./tool/android.nix
  ];

  # Default

  # Tools
  module.tool.android.enable = lib.mkDefault false;

  # Apps
  module.app = {
    bitwarden.enable = lib.mkDefault true;
    obsidian.enable = lib.mkDefault true;
    vlc.enable = lib.mkDefault true;

    sftp.filezilla.enable = lib.mkDefault true;
    virtualisation.boxes.enable = lib.mkDefault false;
    
    dev = {
      java.enable = lib.mkDefault true;
      web.enable = lib.mkDefault true;
      rust.enable = lib.mkDefault false;
      python.enable = lib.mkDefault false;
      c.enable = lib.mkDefault true;

      analysis.enable = lib.mkDefault false;
      docker.enable = lib.mkDefault true;
    };

    gaming = {
      minecraft.enable = lib.mkDefault true;
      steam.enable = lib.mkDefault false;
      switch.enable = lib.mkDefault false;
    };

    browser = {
      zen.enable = lib.mkDefault false;
      firefox.enable = lib.mkDefault true;
    };

    creation = {
      aseprite.enable = lib.mkDefault false;
      blockbench.enable = lib.mkDefault false;
    };

    chat = {
      teams.enable = lib.mkDefault true;
      discord.enable = lib.mkDefault true;
      whatsapp.enable = lib.mkDefault true;
    };
  };

  module.hardware = {
    ssd.enable = lib.mkDefault true;
    thermal.enable = lib.mkDefault false;
  };

  module.wine.enable = lib.mkDefault false;
  module.fonts.enable = lib.mkDefault true;

  # Desktops
  module.desktop = {
    gdm.enable = lib.mkDefault true;

    gnome.enable = lib.mkDefault true;
  };

  # Kernel Stuff
  module.kernel = {
    unstable = lib.mkDefault false;
    controller.enable = lib.mkDefault true;

    intel.enable = lib.mkDefault false;
    nvidia = {
      enable = lib.mkDefault false;
      open = lib.mkDefault false;
      settings = lib.mkDefault true;
    };
  };

  # Services
  module.service.bluetooth.enable = lib.mkDefault true;
  
  # Required Programs
  environment.systemPackages = with pkgs; [
    libnotify
  ];

  # Other
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
