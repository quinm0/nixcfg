{ config, pkgs, ... }:

{
  imports =
    [

    ];

  
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];

}
