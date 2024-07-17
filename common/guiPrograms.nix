{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    alacritty # Terminal app
    vscode # Visual studio code
    signal-desktop # Signal messaging app
    chromium # Chrome
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
