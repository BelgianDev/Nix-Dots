{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.home.app.spotify;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options.home.app.spotify = {
    enable = mkEnableOption "Enable Spotify.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];

    /*programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };*/
  };
}
