{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
  ];

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Exclude xterm from being installed
    excludePackages = with pkgs; [ xterm ];
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-terminal
  ];

  services.gnome.core-utilities.enable = true;

  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.settings-daemon.plugins.power]
      sleep-inactive-ac-timeout=0
      sleep-inactive-battery-timeout=0
      sleep-inactive-ac-type='nothing'
      sleep-inactive-battery-type='nothing'
  '';
}
