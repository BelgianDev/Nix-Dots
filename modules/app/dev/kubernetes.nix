{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.dev.kubernetes;
in {
  options.module.app.dev.kubernetes = {
    enable = mkEnableOption "Kubernetes managment tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubernetes-helm
      kubectl
      fluxcd
      lens
      kustomize
    ];
  };
}
