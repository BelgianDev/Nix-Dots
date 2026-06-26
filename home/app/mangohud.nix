{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.home.app.mangohud;
in {
  options.home.app.mangohud = {
    enable = mkEnableOption "Enable mangohud.";
  };

  config = mkIf cfg.enable {
    stylix.targets.mangohud.enable = false; # Makes it unreadable
    
    programs.mangohud = {
      enable = true;
      settings = {
        gpu_stats = true;
        gpu_temp = true;
        gpu_voltage = true;
        vram = true;
        
        cpu_stats = true;
        cpu_temp = true;
        cpu_power = true;
      };
    };
  };
}
