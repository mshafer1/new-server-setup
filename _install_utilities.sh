#!/bin/bash -v

apt-get update

apt-get upgrade -y

apt-get install \
  nano \
  tmux \
  git-all \
  python3-venv \
  python3-pip \
  python3-dev \
  python3-setuptools \
  python-is-python3 \
  build-essential \
  libssl-dev \
  libffi-dev \
  -y
 
# extra Py libraries
apt-get install \
  bzip2 \
  readline \
  SQLite3 \
  -y
 
# pyenv
curl https://pyenv.run | bash

echo 'PATH="$PATH":~/.pyenv/bin' >> ~/.bash_aliases
