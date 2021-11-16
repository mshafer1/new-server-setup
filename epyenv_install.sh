#!/bin/bash
# easy-pyenv-install
set -e


# runs update, then checks available versions and picks latest that starts with desired value
if [ -z "$1" ]; then
  echo "Usage: $0 VERSION"
  echo "Where VERSION is the major.minor of the desired python version to install"
  exit 1
fi

if [ -n "$2" ]; then
  echo "Usage: $0 VERSION"
  echo "Only one version handled in this version of the script"
  exit 1
fi

# maybe use flag or cache to do once every 24 max??
# pyenv update

full_version=$(pyenv install --list | grep -e "^\s*$1\." | tail -n 1)

echo "Selected $full_version"

pyenv install $full_version

pyenv rehash
