{ config, pkgs, lib, ... }:

{

  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Enable mDNS for local network discovery.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
