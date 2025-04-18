{ pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./hyprland
    ./../../home
  ];

  programs.home-manager.enable = true;

  home = {
    homeDirectory = "/home/raftdev";
    stateVersion = "24.05";
  };

  programs.git = {
    enable = true;
    userName = "RaftDev";
    userEmail = "theraft08@gmail.com";
  };

  programs.gh-dash.enable = true;
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Fixes Graphical Stuff with java
  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}