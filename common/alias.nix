{ pkgs, config, libs, ... }:

{
  programs.bash.shellAliases = {
    ecfg = "sudo nano /etc/nixos/quin.nix && sudo nixos-rebuild switch";
  };
}