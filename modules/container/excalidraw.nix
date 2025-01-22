{ config, lib, ... }:

with lib;

let
  cfg = config.module.container.excalidraw;
in {
  options.module.container.excalidraw = {
    enable = mkEnableOption "Enable excalidraw container";
  };

  config = mkIf cfg.enable {
    virtualisation.oci-containers.containers.excalidraw = {
      image = "excalidraw/excalidraw:latest";
      ports = ["5000:8080"];      
    };
  };
}
