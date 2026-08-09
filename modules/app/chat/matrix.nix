{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.chat.matrix;
in {
  options.module.app.chat.matrix = {
    enable = mkEnableOption "Enable Matrix.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (symlinkJoin {
          name = "element-desktop-wrapped";
          paths = [ element-desktop ];
          nativeBuildInputs = [ makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/element-desktop \
              --add-flags '--password-store="gnome-libsecret"'
          '';
        })
    ];
  };
}
