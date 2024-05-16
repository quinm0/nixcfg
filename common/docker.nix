{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ctop
  ];
  virtualisation.docker.enable = true;
  users.users.qmoran.extraGroups = [ "docker" ];

}
