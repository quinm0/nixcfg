#!/bin/bash


if [ -d "/etc/nixos" ]; then
  if [ -d "/etc/nixos/.git" ]; then
    current_remote=$(git -C /etc/nixos remote get-url origin)
    expected_remote="git@github.com:quinm0/nixcfg.git"
    if [ "$current_remote" == "$expected_remote" ]; then
      echo "Repository already exists and matches the expected remote. Skipping cloning."
    else
      echo "Repository already exists but does not match the expected remote. Please update the remote URL."
    fi
  else
    echo "Directory /etc/nixos exists but is not a git repository. Please remove or rename the directory."
  fi
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