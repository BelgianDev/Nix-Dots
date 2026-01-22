{ pkgs, ... }:

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
    screen
    parted
    age

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
    htop
    btop
    mtr

    # Java
    pkgs.unstable.jdk25
    pkgs.unstable.jdk21
    pkgs.unstable.jdk17
    # Macros
    xdotool

    # Improved
    fzf
    atuin
    dust
    eza
    zoxide

    # Monitoring
    htop
    btop
    mtr

    # Java
    pkgs.unstable.jdk25
    pkgs.unstable.jdk21
    pkgs.unstable.jdk17
    pkgs.unstable.jdk8

    # Random Stuff
    pipes-rs
    figlet
    cowsay
    cmatrix
    cbonsai
    pfetch-rs
    fastfetch
    cava
  ];
}
