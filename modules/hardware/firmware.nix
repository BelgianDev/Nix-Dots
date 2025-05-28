{ lib, ... }: 

{
  services.fwupd.enable = true;
  hardware.enableAllFirmware = lib.mkDefault true;
}
