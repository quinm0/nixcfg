{ pkgs, config, libs, ... }:

{
  virtualisation.docker = {
    enable = true;
    liveRestore = false; # Swarm doesn't work without this
    enableNvidia = true; # Enable nvidia compute for docker
  };
}
