# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./common/gnome.nix
      ./common/tailscale.nix
    ];

  environment.systemPackages = with pkgs; [
    git
    gh
    vscode
    trash-cli
    lazygit
  ];

}
