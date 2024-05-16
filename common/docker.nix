{ config, pkgs, ... }:

{

  virtualisation.docker.enable = true;
  users.users.qmoran.extraGroups = [ "docker" ];

}
