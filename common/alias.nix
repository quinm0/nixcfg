{ pkgs, config, libs, ... }:

{
  programs.bash.shellAliases = {
    ecfg = "sudo nano /etc/nixos/quin.nix && sudo nixos-rebuild switch";
    up = "docker compose up -d";
    down = "docker compose down";
    nixos-config = "/etc/nixos/updateConfig.sh";
  };
}