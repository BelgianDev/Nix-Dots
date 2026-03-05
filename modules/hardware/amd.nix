{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.hardware.amd;
in {
  options.module.hardware.amd = {
    enable = mkEnableOption "Enable AMD tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      amdgpu_top
    ];
  };
}
