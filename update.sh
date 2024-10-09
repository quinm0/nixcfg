#!/bin/bash

# Update packages
sudo nix-channel --update

# Update the system
sudo nixos-rebuild switch --upgrade
