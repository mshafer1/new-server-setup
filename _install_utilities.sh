#!/bin/bash -v

apt-get update

apt-get upgrade -y

apt-get install \
  nano \
  tmux \
  python3-venv \
  python3-pip \
  python3-dev \
  python3-setuptools \
  python-is-python3 \
  build-essential \
  libssl-dev \
  libffi-dev \
  -y
  
