#!/bin/bash


if [ -d "/etc/nixos/.git" ]; then
  echo "Repository already exists. Skipping cloning."
else
  git clone git@github.com:quinm0/nixcfg.git /etc/nixos
fi

read -p "Enter the machine hostname: " hostname

if [ -f "/etc/nixos/hosts/$hostname.nix" ]; then
  echo "Host configuration file already exists. Skipping creation."
else
  cp /etc/nixos/hosts/template.nix.template "/etc/nixos/hosts/$hostname.nix"
  sed -i "s/\$HOSTNAME/$hostname/g" "/etc/nixos/hosts/$hostname.nix"
fi