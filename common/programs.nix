{ config, pkgs, inputs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    git
    gh
    trash-cli
    lazygit
    pulumi
    bun
    pciutils
    nodejs_18
    openssl
    htop
    vim
    psmisc
  ];
}
