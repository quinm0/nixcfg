#!/bin/bash

echo "Installing NixOS configuration..."
echo "allow sudo without password"

sudo ls

# Set permission tracking to false
git config core.filemode false

# Set permissions for /etc/nixos directory
sudo chmod -R 777 /etc/nixos



if [ -d "/etc/nixos/.git" ]; then
  echo "Repository already exists. Skipping cloning."
else
  echo "Directory is not empty. Performing a forced clone."
  git clone https://github.com/quinm0/nixcfg.git /tmp/nixcfg
  mv /tmp/nixcfg/* /etc/nixos/
  mv /tmp/nixcfg/.* /etc/nixos/
  rm -rf /tmp/nixcfg
fi

read -p "Enter the machine hostname: " hostname

if [ -f "/etc/nixos/hosts/$hostname.nix" ]; then
  echo "Host configuration file already exists. Skipping creation."
else
  cp /etc/nixos/hosts/template.nix.template "/etc/nixos/hosts/$hostname.nix"
  sed -i "s/\$HOSTNAME/$hostname/g" "/etc/nixos/hosts/$hostname.nix"
fi
