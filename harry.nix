# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./common/tailscale.nix
      ./common/programs.nix
      ./common/docker.nix
      ./common/nvidia.nix
      ./common/alias.nix
    ];

  # Have to set this for nvidia.nix
  nvidia.prime.nvidiaBusId = "PCI:01:00.0";

  networking.hostName = lib.mkForce "harry";

  environment.systemPackages = with pkgs; [
    mergerfs
  ];

  fileSystems."/mnt/d1" = { 
    device = "/dev/disk/by-uuid/2bc9f072-5da3-44f2-b606-d72656b90d91";
    fsType = "ext4";
  };

  fileSystems."/mnt/d2" = {
    device = "/dev/disk/by-uuid/786f905a-b49c-4a9f-89e2-7366b5bbe558";
    fsType = "ext4";
  };

  fileSystems."/mnt/d3" = {
    device = "/dev/disk/by-uuid/51360796-4d3b-43d8-8fa8-b877f48f73e8";
    fsType = "ext4";
  };

  fileSystems."/mnt/d4" = {
    device = "/dev/disk/by-uuid/a6a33e86-320d-492e-ab63-ca60be3a293d";
    fsType = "ext4";
  };

  fileSystems."/mnt/d5" = {
    device = "/dev/disk/by-uuid/887500d5-1d4d-4080-84e3-5ef424c9f310";
    fsType = "ext4";
  };

  fileSystems."/mnt/d6" = {
    device = "/dev/disk/by-uuid/a2a227dc-2104-44dd-8a41-29fa11b855a1";
    fsType = "ext4";
  };

  fileSystems."/mnt/d7" = {
    device = "/dev/disk/by-uuid/b5156e14-91b7-4047-8bb3-d258b87d1cfd";
    fsType = "ext4";
  };

  fileSystems."/mnt/d8" = {
    device = "/dev/disk/by-uuid/9ade4c8b-d721-4455-8c0d-a628a4684461";
    fsType = "ext4";
  };

  fileSystems."/mnt/data" = {
    device = "/mnt/d1:/mnt/d2:/mnt/d3:/mnt/d4:/mnt/d5:/mnt/d6:/mnt/d7:/mnt/d8"; # Paths to the storage devices to be merged
    fsType = "fuse.mergerfs";
    options = [
      "defaults"
      "allow_other"
    ];
  };

}
