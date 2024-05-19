# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./common/gnome.nix
      ./common/tailscale.nix
      ./common/programs.nix
      ./common/guiPrograms.nix
      ./common/docker.nix
      ./common/nvidia.nix
      ./common/docker-nvidia.nix
      ./common/alias.nix
    ];

  networking.hostName = lib.mkForce "alfred";
}
