{ config, pkgs, lib, ... }:

{

  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
  ];

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
      caligula
      neofetch
      zoxide
    ];
  };
}
