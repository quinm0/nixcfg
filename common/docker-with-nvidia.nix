{ pkgs, config, libs, ... }:

{
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker = {
    enable = true;
    liveRestore = false; # Swarm doesn't work without this
  };
}
