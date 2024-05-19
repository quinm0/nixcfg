{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    git
    gh
    trash-cli
    lazygit
    pulumi
    volta
    bun
    pciutils
  ];
}
