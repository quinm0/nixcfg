# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./common/tailscale.nix
      ./common/programs.nix
      ./common/docker.nix
      ./common/alias.nix
      ./common/mdns.nix
      ./common/fish.nix
      ./common/gnome.nix
      ./common/guiPrograms.nix
      # ./common/yubikey.nix
      # ./common/yubikeyLock.nix
      # ./common/nvidia.nix
      # ./common/docker-nvidia.nix
    ];

  networking.hostName = lib.mkForce "cecil";
}
