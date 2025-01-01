{ pkgs, pkgs-unstable, ... }:

{
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [

    # Tools
    git
    nano
    tree
    ffmpeg
    killall
    ipcalc

    # Formatters
    nixfmt-rfc-style

    # Archives
    zip
    xz
    unzip
    p7zip

    # Compilers
    gcc

    # Web
    curl
    wget

    # Flashing
    caligula

    # System Info
    lsof
    lshw
    usbutils
    pciutils
    ethtool
    sysstat
    smartmontools

    # Secrets
    sops

    # Macros
    xdotool

    # Improved
    fzf
    atuin
    dust
    bat
    eza
    zoxide

    # Monitoring
    htop
    btop
    mtr
    iotop
    iftop

    # Java
    pkgs-unstable.jdk21
    pkgs-unstable.jdk17
    pkgs-unstable.jdk8

    # Funny Stuff
    pipes-rs
    figlet
    cowsay
    cmatrix
    cbonsai
    pfetch-rs
    fastfetch
  ];
}
