{ config, pkgs, ... }:

{
  imports =
    [

    ];
  
  environment.systemPackages = with pkgs; [
  ];

  services.tailscale.enable = true;
}
