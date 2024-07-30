#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
fi

pushd /etc/nixos/ 

hostname=$(hostname)
if [ "$hostname" == "nixos" ]; then
  read -p "Enter the current machine's hostname: " hostname
fi

nix_file="${hostname}.nix"

if [ ! -f "$nix_file" ]; then
  read -p "File $nix_file does not exist. Would you like to create it? (y/n): " create_file
  if [ "$create_file" != "y" ]; then
    echo "File $nix_file was not created. Exiting."
    exit 1
  fi
  sed "s|#hostname_placeholder#|networking.hostName = lib.mkForce \"$hostname\";|" template.nix > "$nix_file"
fi

nano "$nix_file"
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd