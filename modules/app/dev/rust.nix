{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.app.dev.rust;
in {
  options.module.app.dev.rust = {
    enable = mkEnableOption "Enable Rust Developpement Tools.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.jetbrains.rust-rover

      rustup
      rustc
      cargo
    ];
  };
}
