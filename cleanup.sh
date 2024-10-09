#!/bin/bash

# This script performs cleanup tasks
nix-env --delete-generations 30d

# Clean up the nix store
nix-store --gc
sudo nix-collect-garbage -d