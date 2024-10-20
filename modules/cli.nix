{ pkgs, pkgs-unstable, ... }: 

{
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    
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
