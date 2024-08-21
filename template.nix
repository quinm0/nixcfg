{ config, pkgs, ... }:

{
  imports =
    [
      ./common/tailscale.nix
      ./common/programs.nix
      ./common/docker.nix
      ./common/alias.nix
      ./common/mdns.nix
      # ./common/gnome.nix
      # ./common/guiPrograms.nix
      # ./common/yubikey.nix
      # ./common/yubikeyLock.nix
      # ./common/nvidia.nix
      # ./common/docker-nvidia.nix
    ];

  
  environment.systemPackages = with pkgs; [
  ];

  #hostname_placeholder#
}
