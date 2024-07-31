#!/usr/bin/env bash
set -e

# Ensure sudo permissions are obtained at the start
sudo -v

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
sudo nixos-rebuild switch &>/tmp/nixos-switch.log
if [ $? -ne 0 ]; then
  cat /tmp/nixos-switch.log | grep --color error
  exit 1
fi
gen=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
git commit -am "$hostname Generation $gen"
popd