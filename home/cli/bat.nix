{ config, lib, ... }:

with lib;

let
  cfg = config.home.cli.bat;
in {
  options.home.cli.bat = {
    enable = mkEnableOption "Enable bat (cat but better) Configuration.";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };
  };
}
