{ config, pkgs, lib, ... }:

{
  users.users.qmoran = {
    isNormalUser = true;
    description = "Quin Moran";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # CLI tools
      git
      gh
      trash-cli
      lazygit
      bun
      htop

      # GUI tools
      signal-desktop
      spotify
      prusa-slicer
      rpi-imager
      gparted
      google-chrome
    ];
  };
}
