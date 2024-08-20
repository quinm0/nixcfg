{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    alacritty # Terminal app
    vscode # Visual studio code
    signal-desktop # Signal messaging app
    spotify
    prusa-slicer
    rpi-imager
    gparted
    google-chrome
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
