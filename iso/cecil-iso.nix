{ config, pkgs, lib, ... }:

{
  # Import the installation CD module
  imports = [
    ../hosts/cecil.nix  # Adjust the path if necessary
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
  ];

  # Include any additional packages you want on the ISO
  environment.systemPackages = with pkgs; [];

  isoImage.isoName = lib.mkForce "cecil-nixos.iso";
}
