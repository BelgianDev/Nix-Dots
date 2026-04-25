{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.creation.picard;
in {
  options.module.app.creation.picard = {
    enable = mkEnableOption "Enable picard.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      picard
    ];
  };
}
