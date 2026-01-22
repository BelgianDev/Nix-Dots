{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.dev.java;
in {
  options.module.app.dev.java = {
    enable = mkEnableOption "Enable Java Developpement Tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.jetbrains.idea
      visualvm
    ];

    # Enable perf as user - Intelij
    boot.kernel.sysctl."kernel.perf_event_paranoid" = -1;
    boot.kernel.sysctl."kernel.kptr_restrict" = lib.mkForce 0;
  };
}
