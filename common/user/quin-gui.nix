{ config, pkgs, lib, ... }:

{
  users.users.qmoran = {
    isNormalUser = true;
    description = "Quin Moran";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "docker"
    ];
    
    packages = with pkgs; [
      # CLI tools
      git
      gh
      trash-cli
      lazygit
      bun
      htop
      ctop

      # GUI tools
      signal-desktop
      spotify
      prusa-slicer
      rpi-imager
      vscode
      gparted
      google-chrome
    ];
  };
}
