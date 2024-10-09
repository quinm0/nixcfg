{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./common/tailscale.nix
      ./common/programs.nix
      ./common/docker.nix
      ./common/alias.nix
      ./common/mdns.nix
      ./common/gnome.nix
      ./common/guiPrograms.nix
    ];

  networking.hostName = lib.mkForce "cecil";
}
