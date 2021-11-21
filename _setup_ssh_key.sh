#!/bin/bash -v
set -e

key_file=${1:-~/.ssh/id_rsa}

if [[ -f $key_file ]]; then
  echo "File $key_file already exists. Skipping."
  exit 0
fi

echo "Generating ssh key $key_file"
ssh-keygen -t rsa -N '' -f $key_file

echo "Adding to ssh-agent"
eval $(ssh-agent) 
ssh-add $key_file
echo 'ssh-add $key_file > /dev/null' >> ~/.bashrc
cat "$key_file.pub"
