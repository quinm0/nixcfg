{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Exclude xterm from being installed
    excludePackages = with pkgs; [ xterm ];
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-terminal
  ];

  services.gnome.core-utilities.enable = false;

}
