{ pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./../../home
  ];

  programs.home-manager.enable = true;

  home = {
    homeDirectory = "/home/raftdev";
    stateVersion = "26.05";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "RaftDev";
      email = "theraft08@gmail.com";
    };

    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Fixes Graphical Stuff with java
  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };
}