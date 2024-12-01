{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.home.app.editor.vscode;
in {
  options.home.app.editor.vsocde = {
    enable = mkEnableOption "Enable vscode's configuration.";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false; # Fuck off update popups
      package = pkgs-unstable.vscodium
    };
  };
}
