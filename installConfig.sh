#!/usr/bin/env bash
set -e

# Ensure sudo permissions are obtained at the start
sudo -v

pushd /etc/nixos/

# exit if already in a .git repo
if [ -d .git ]; then
  echo "Already in a git repo. Exiting."
  exit 1
fi

popd