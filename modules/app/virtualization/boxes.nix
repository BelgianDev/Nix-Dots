{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.app.virtualisation.boxes;
in {
  options.module.app.virtualisation.boxes = {
    enable = mkEnableOption "Enables Boxes and virtualisation on the system.";
  };

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true; # Enables copy and paste bewteen host and guest.

    environment.systemPackages = with pkgs-unstable; [
      gnome-boxes
    ];
  };
}
