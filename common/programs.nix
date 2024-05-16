{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    git
    gh
    vscode
    trash-cli
    lazygit
    pulumi
    volta
    bun
  ];
}
