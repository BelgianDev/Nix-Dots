{ config, lib, pkgs-unstable, ... }:

with lib;

let
  cfg = config.module.kernel;
in {
  options.module.kernel = {
    unstable = mkEnableOption "Use the kernel from Nixpkgs unstable.";
  };

  config = mkIf cfg.unstable {
    boot.kernelPackages = pkgs-unstable.linuxPackages;
  };
}
