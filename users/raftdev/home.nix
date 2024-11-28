{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
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

  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Fixes Graphical Stuff with java
  programs.java = {
    enable = true;
    package = (pkgs.jdk17.override { enableJavaFX = true; });
  };
}