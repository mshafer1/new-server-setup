#!/bin/bash -v

apt-get update

apt-get upgrade -y

apt-get install -y \
  nano \
  tmux \
  make \
  wget \
  curl \
  git-all \
  build-essential \
  libssl-dev \
  libffi-dev

# python likes git to already be installed
apt-get install -y \
  python3-dev \
  python3-venv \
  python3-pip \
  python3-setuptools \
  python-is-python3

 
# extra Py libraries - https://github.com/pyenv/pyenv/wiki#troubleshooting--faq
apt-get install \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  llvm \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  -y
 
# pyenv
curl https://pyenv.run | bash

curl -sSL https://install.python-poetry.org | python -

python -m pip install pipx-in-pipx

~/.local/bin/pipx install jrnl

echo 'PATH="$PATH":~/.pyenv/bin:~/.local/bin' >> ~/.bash_aliases
