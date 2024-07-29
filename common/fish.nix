{ config, pkgs, ... }:

{
  # Install Fish shell
  environment.systemPackages = with pkgs; [
    fish
  ];

  # Set Fish as the default shell for your user
  users.users.qmoran = {
    isNormalUser = true;
    home = "/home/qmoran";
    shell = "${pkgs.fish}/bin/fish";
    # Other user settings...
  };

  # Ensure Fish is listed in /etc/shells
  environment.etc."shells".text = ''
    /bin/sh
    /bin/bash
    /usr/bin/env bash
    ${pkgs.fish}/bin/fish
  '';
}