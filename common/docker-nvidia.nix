{ pkgs, config, libs, ... }:

{
  virtualisation.docker = {
    liveRestore = false; # Swarm doesn't work without this
    enableNvidia = true; # Enable nvidia compute for docker
  };
}
