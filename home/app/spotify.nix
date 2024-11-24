{ config, lib, pkgs, pkgs-unstable, inputs, ... }:

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
      spicetifyPackage = pkgs-unstable.spicetify-cli;

      enabledCustomApps = with spicePkgs.apps; [
        newReleases
      ];

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
        fullAppDisplay
        trashbin

        copyToClipboard
        powerBar
        fullAlbumDate
        history
        betterGenres
        playingSource
        oneko
      ];
    };
  };
}
