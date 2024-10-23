{ pkgs, pkgs-unstable, ... }: 

{
  programs.fish.enable = true;
  environment.systemPackages = with pkgs-unstable; [
    
    # Tools
    git
    nano
    curl
    wget
    unzip
    tree
    lsof
    lshw
    ffmpeg
    killall
    caligula # USB Flashing

    # Secrets
    sops
    
    # Libs
    libnotify

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

    # Java
    jdk21
    jdk17
    jdk8

    # Funny Stuff
    pipes-rs
    cava
    figlet
    cowsay
    cmatrix
    cbonsai
    pfetch
    neofetch
  ];
}
