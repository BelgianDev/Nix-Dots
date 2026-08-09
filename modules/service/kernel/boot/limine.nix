{ config, lib, ... }:

with lib;

let
  cfg = config.module.kernel.boot.limine;
in {
  options.module.kernel.boot.limine = {
    enable = mkEnableOption "Enable Limine module";
    dual-win = mkEnableOption "Whether to set up Limine with Windows Dual boot";
  };

  config = mkIf cfg.enable {
    boot.loader = {
      limine = {
        enable = true;  
        extraEntries = mkIf cfg.dual-win ''
          /Windows 11
            protocol: efi
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
            comment:    Boot into Windows 11
        '';

        style.interface = {
          branding = "NixOS - ${config.networking.hostName}";
        };
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
