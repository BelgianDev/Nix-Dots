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
    programs.spicetify = {
      enable = true;

      enabledCustomApps = with spicePkgs.apps; [
        newReleases
      ];

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        trashbin
        oneko
      ];
    };
  };
}
