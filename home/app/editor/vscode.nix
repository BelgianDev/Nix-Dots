{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.app.editor.vscode;
in {
  options.home.app.editor.vscode = {
    enable = mkEnableOption "Enable vscode's configuration.";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        enableUpdateCheck = false; # Fuck off update popups
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ];

        userSettings = {
          "files.autoSave" = "onFocusChange";
          "git.confirmSync" = false;

          # Editor LSP
          "nix.serverPath" = "nixd";
          "nix.enableLanguageServer" = true;
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
          "nixpkgs" = {
            "expr" = "import <nixpkgs> { }";
          };
        };
      };
    };

    home.packages = with pkgs; [
      nixd
    ];
  };
}
