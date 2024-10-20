{ lib, ... }:

{
  imports = [
    ./raftdev/raftdev.nix
  ];

  security.sudo.wheelNeedsPassword = lib.mkDefault true;
}