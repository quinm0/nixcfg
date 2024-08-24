{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; 
    let 
      zen-browser = builtins.getFlake("github:MarceColl/zen-browser-flake");
    in [
      alacritty # Terminal app
      vscode # Visual studio code
      signal-desktop # Signal messaging app
      spotify
      prusa-slicer
      rpi-imager
      gparted
      google-chrome
      zen-browser.packages."${system}".default
    ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
