{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.module.app.neovim;
in {
  options.module.app.neovim = {
    enable = mkEnableOption "Enable Neovim.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
