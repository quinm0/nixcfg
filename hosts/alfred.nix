# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "alfred";
  networking.networkmanager.enable = true;
  systemd.services."NetworkManager-wait-online".enable = false;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  environment.systemPackages = with pkgs; [
    home-manager
  ];

  imports =
    [
      # Hardware
      ../hardware-configuration.nix
      ../common/nvidia.nix

      # Users
      ../common/user/quin-gui.nix

      # Functionality
      ../common/gaming.nix
      ../common/gnome.nix
      ../common/docker-with-nvidia.nix
      ../common/pipewire.nix

      # Configuration
      ../common/tailscale.nix
      ../common/locale.nix
      ../common/services.nix

      # Security
      ../common/yubikey.nix
      ../common/yubikeyLock.nix
    ];
}
