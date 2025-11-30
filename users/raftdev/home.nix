{ pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./../../home
  ];

  programs.home-manager.enable = true;

  home = {
    homeDirectory = "/home/raftdev";
    stateVersion = "25.11";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "RaftDev";
      email = "theraft08@gmail.com";
    };
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
    package = pkgs.jdk25;
  };
}